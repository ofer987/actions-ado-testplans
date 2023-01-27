#!/usr/bin/env bash

# This is Shell Script which is equivalent to GH Action. 
# This will help you if you want to accomplish the same pattern from AWS CodeBuild or from BrowserStack.
# This Script will upload test results to Azure DevOps. 
# Feel Free to Copy The Shell Script to your Project GitHub Repo.
# But Please send us a note or mark Star if you are using this script so we can help you with future changes or do troubleshooting
# Please provide your secrets very securely using AWS Secret Manager otherwise the keys will get printed in logs which will leak passwords
env='QA'
TEST_RESULTS_WITH_ATTACHMENTS='false'
TEST_RESULTS_ATTACHED_FILES="NOT APPLICABLE"
ARTIFACTORY_TOKEN=${ARTIFACTORY_TOKEN}
ARTIFACTORY_USER=${ARTIFACTORY_USER}
ADO_PAT=${ADO_PAT}
RUN_COMMENT=${GH_PAGES_TEST_RUN_URL}
RUN_RESULT_COMMENT=${GH_PAGES_TEST_RUN_URL}
ADO_PROJECT_URL=https://dev.azure.com/tr-ihn-sandbox/
CUCUMBER_PATH="./features"
TEST_RESULTS_RUN_NAME="AWS CodeBuild - ${CODEBUILD_BUILD_ID}"
TEST_RESULTS_PATH="results/cucumber.json"
TEST_RESULTS_FORMAT="cucumberJson"
# Make sure you have such config present in ADO test plans what ever entered here
TEST_RESULTS_CONFIG="Linux-X64"
CHILD_JSON=$(find . -iname "specsync.json" | tr '\n' ',' )
PARENT_JSON=$(find . -iname "specsync-parent.json" )
echo CHILD_JSON=${CHILD_JSON}
echo PARENT_JSON=${PARENT_JSON}
echo "Child Json: $CHILD_JSON"
echo "Parent Json: $PARENT_JSON"

# VARIABLE SUBSTITUTION IN SPECSYNC JSON DYNAMICALLY 

sed -i "s/##ADO_PROJECT_URL##/$ADO_PROJECT_URL/g" **/specsync.json
sed -i "s/##ADO_PAT##/$ADO_PAT/g" **/specsync.json
sed -i "s/##TEST_RESULTS_RUN_NAME##/$TEST_RESULTS_RUN_NAME/g" **/specsync.json

sed -i "s/##ADO_PROJECT_URL##/$ADO_PROJECT_URL/g" **/specsync-parent.json
sed -i "s/##ADO_PAT##/$ADO_PAT/g" **/specsync-parent.json
sed -i "s/##TEST_RESULTS_RUN_NAME##/$TEST_RESULTS_RUN_NAME/g" **/specsync-parent.json


# Download SpecSync License From Artifactory
curl -u ${ARTIFACTORY_USER}:${ARTIFACTORY_TOKEN} -O 'https://tr1.jfrog.io/artifactory/generic-local/devops-experience/specsync.lic'
CUCUMBER_DIRNAME=$(dirname ${CUCUMBER_PATH} )
mv specsync.lic ${CUCUMBER_DIRNAME}

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

results_with_attachments() {
    find ${CUCUMBER_PATH} -type f -name "*.feature" | while read line;
    do
        CWD=$PWD
        line=$(echo $line)
        DIR=$(dirname "$line")
        echo $DIR
        cd $DIR
        FEATURE_NAME=$(basename $DIR)
        dotnet specsync publish-test-results --user "${ADO_PAT}" -v --log output.txt --zeroExitCodeForWarnings -r "${TEST_RESULTS_PATH}" -f "${TEST_RESULTS_FORMAT}" -c "${TEST_RESULTS_CONFIG}" --runName "${TEST_RESULTS_RUN_NAME}-Env:${ENV}-Suite:${FEATURE_NAME}" --runComment "${{ inputs.RUN_COMMENT }}" --runResultComment "${{ inputs.RUN_RESULT_COMMENT }}" 2> /dev/null;
        cat output.txt;
        ADO_SUITE_RUN_URL=$(grep 'results as Test Run' output.txt | sed 's/.*[(] *//'| sed 's/).//g')
        ADO_SUITE_RUN_URL="$ADO_SUITE_RUN_URL"
        echo "##[set-output name=ADO_SUITE_RUN_URL;]${ADO_SUITE_RUN_URL}"
        echo "TEST SUITE RUN URL for ${DIR} : ${ADO_SUITE_RUN_URL}"
        cd $CWD
    done;
}

results_without_attachments() {
    # Run Test Results Synchronization with Attachments
    find ${CUCUMBER_PATH} -type f -name "*.feature" | while read line;
    do
        CWD=$PWD
        line=$(echo $line)
        DIR=$(dirname "$line")
        echo $DIR
        cd $DIR
        FEATURE_NAME=$(basename $DIR)
        dotnet specsync publish-test-results --user "${ADO_PAT}" -v --log output.txt --zeroExitCodeForWarnings -r "${TEST_RESULTS_PATH}" -f "${TEST_RESULTS_FORMAT}" -c "${TEST_RESULTS_CONFIG}" --attachedFiles "${TEST_RESULTS_ATTACHED_FILES}" --runName "${TEST_RESULTS_RUN_NAME}-Env:${ENV}-Suite:${FEATURE_NAME}" --runComment "${{ inputs.RUN_COMMENT }}" --runResultComment "${{ inputs.RUN_RESULT_COMMENT }}" 2> /dev/null;
        cat output.txt
        ADO_SUITE_RUN_URL=$(grep 'results as Test Run' output.txt | sed 's/.*[(] *//'| sed 's/).//g')
        ADO_SUITE_RUN_URL="$ADO_SUITE_RUN_URL"
        echo "##[set-output name=ADO_SUITE_RUN_URL;]${ADO_SUITE_RUN_URL}"
        echo "TEST SUITE RUN URL for ${DIR} : ${ADO_SUITE_RUN_URL}"
        cd $CWD
    done;

}

# Run Test Results Synchronization with out Attachments
if [TEST_RESULTS_WITH_ATTACHMENTS == 'true']
then
   results_with_attachments
elif [TEST_RESULTS_WITH_ATTACHMENTS == 'false']
   results_without_attachments
fi

# Erase SpecSync License Files
rm -rf ${CUCUMBER_PATH}/specsync.lic
