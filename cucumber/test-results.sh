#!/usr/bin/env bash

# This is Shell Script which is equivalent to GH Action. 
# This will help you if you want to accomplish the same pattern from AWS CodeBuild or from BrowserStack.
# This Script will upload test results to Azure DevOps. 
# Feel Free to Copy The Shell Script to your Project GitHub Repo.
# But Please send us a note or mark Star if you are using this script so we can help you with future changes or do troubleshooting
# Please provide your secrets very securely using AWS Secret Manager otherwise the keys will get printed in logs which will leak passwords
export CODEBUILD_BUILD_ID=123456789
export ENVIRONMENT=QA
export GH_PAGES_TEST_RUN_URL=https://thomsonreuters.com/
env=${ENVIRONMENT}
AWS_CB_HOME=$PWD
ARTIFACTORY_TOKEN=${ARTIFACTORY_TOKEN}
ARTIFACTORY_USER=${ARTIFACTORY_USER}
ADO_PAT=${ADO_PAT}
AREA_PATH="\\OSPI Release Automation QA"
ITERATION_PATH="\\Test"
TEST_PLAN_ID=832988
RUN_COMMENT=${GH_PAGES_TEST_RUN_URL}
RUN_RESULT_COMMENT=${GH_PAGES_TEST_RUN_URL}
ADO_PROJECT_URL=https://dev.azure.com/tr-corp-tax/CTTSharedServices
CUCUMBER_PATH="src/test/features"
TEST_RESULTS_RUN_NAME="AWS CodeBuild - ${CODEBUILD_BUILD_ID}"
TEST_RESULTS_PATH="${AWS_CB_HOME}/.github/cucumber_report.json"
TEST_RESULTS_FORMAT="cucumberJson"
#download specsync json
curl -u ${ARTIFACTORY_USER}:${ARTIFACTORY_TOKEN} -O 'https://tr1.jfrog.io/artifactory/generic-local/devops-experience/cucumber/specsync.json'
CWD=$PWD
SPECSYNC_JSON_PATH=$CWD/specsync.json
echo "SpecSync Json Path: $SPECSYNC_JSON_PATH"
# Make sure you have such config present in ADO test plans what ever entered here
TEST_RESULTS_CONFIG="Chrome"


# VARIABLE SUBSTITUTION IN SPECSYNC JSON DYNAMICALLY 

sed -i -e "s|ADO_PROJECT_URL|$ADO_PROJECT_URL|g" $SPECSYNC_JSON_PATH
sed -i -e "s|ADO_PAT|$ADO_PAT|g" $SPECSYNC_JSON_PATH
sed -i -e "s|ADO_AREA_PATH|$AREA_PATH|g" $SPECSYNC_JSON_PATH
sed -i -e "s|ADO_ITERATION_PATH|$ITERATION_PATH|g" $SPECSYNC_JSON_PATH
sed -i -e "s|999999|$TEST_PLAN_ID|g" $SPECSYNC_JSON_PATH
sed -i -e "s|ADO_DUMMY_URL|$ADO_PROJECT_URL|g" $SPECSYNC_JSON_PATH

# Download SpecSync License From Artifactory
curl -u ${ARTIFACTORY_USER}:${ARTIFACTORY_TOKEN} -O 'https://tr1.jfrog.io/artifactory/generic-local/devops-experience/specsync.lic'
CWD=$PWD
LICENSE_PATH=$CWD/specsync.lic
echo LICENSE_PATH=${LICENSE_PATH}
echo "SpecSync License Path: $LICENSE_PATH"

# DOTNET INSTALL 6.0         
# https://dot.net/v1/dotnet-install.sh
wget https://dot.net/v1/dotnet-install.sh
sudo chmod +x ./dotnet-install.sh
./dotnet-install.sh --version latest

# DOTNET PATH
export PATH="$PATH:/root/.dotnet/tools"
# DOTNET TOOL MANIFEST
dotnet new tool-manifest
dotnet tool install SpecSync.AzureDevOps --version 3.4.0
dotnet specsync version

test_results_sync() {
    find ${CUCUMBER_PATH} -type f -name "*.feature" | while read line;
    do
        CWD=$PWD
        line=$(echo $line)
        DIR=$(dirname "$line")
        echo $DIR
        cd $DIR
        DIR="${DIR%/}"
        SUBDIR="${DIR##*/}"
        FILE=specsync.json
        if [ -f "$FILE" ]; then
        echo "$FILE exists."
        else 
            echo "$FILE does not exist."
            cp ${SPECSYNC_JSON_PATH} ./
            tmp=$(mktemp)
            jq --arg a "$SUBDIR" '.remote.testSuite.name = $a' ./specsync.json > "$tmp" && mv "$tmp" ./specsync.json
        fi
        FEATURE_NAME=$(basename $DIR)      
        dotnet specsync publish-test-results --license ${LICENSE_PATH} --user ${ADO_PAT} -v --log output.txt --zeroExitCodeForWarnings -r "${TEST_RESULTS_PATH}" -f "${TEST_RESULTS_FORMAT}" -c "${TEST_RESULTS_CONFIG}" --runName "${TEST_RESULTS_RUN_NAME}-Env:${ENVIRONMENT}-Suite:${FEATURE_NAME}" --runComment "${RUN_COMMENT}" --testResultComment "${RUN_RESULT_COMMENT}" 2> /dev/null;
        cat output.txt;
        ADO_SUITE_RUN_URL=$(grep 'results as Test Run' output.txt | sed 's/.*[(] *//'| sed 's/).//g')
        echo "ADO_SUITE_RUN_URL=$ADO_SUITE_RUN_URL"
        echo "ADO_SUITE_RUN_URL=$ADO_SUITE_RUN_URL"
        echo "TestSuite Run [${DIR}](${ADO_SUITE_RUN_URL})"
        ADO_RUN_ID=$(echo $ADO_SUITE_RUN_URL | awk -F'=' '{print $2;}' | sed 's|&_a||g')
        ADO_RUN_ID=()
        ADO_RUN_ID+=("$ADO_RUN_ID")
        ADO_RUN_URL=()
        ADO_RUN_URL+=("$ADO_SUITE_RUN_URL")
        cd $CWD
    done;
    echo "ADO_PROJECT_URL=${ADO_PROJECT_URL}/_testManagement/runs?_a=runQuery"
    ADO_RUN_ID_ARRAY=$(echo "${ADO_RUN_ID[@]}")
    ADO_RUN_URL_ARRAY=$(echo "${ADO_RUN_URL[@]}")
    echo "ADO_RUN_ID_ARRAY=$(echo "${ADO_RUN_ID[@]}")"
    echo "ADO_RUN_URL_ARRAY=$(echo "${ADO_RUN_URL[@]}")"
}

# Call Function
test_results_sync

# Erase SpecSync License Files
rm -rf ${CUCUMBER_PATH}/specsync.lic
