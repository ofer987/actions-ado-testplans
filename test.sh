TEMP_FILE=response.json
WF_NAME='Create-Bugs'
WF_ID=$(gh workflow list | grep $WF_NAME | awk '{ print $3 }')
gh api \
  -H "Accept: application/vnd.github+json" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  /repos/tr/cicd_gh-actions-ado-testplans/actions/workflows/$WF_ID/runs > $TEMP_FILE

STATUS=$(jq -r ".workflow_runs | sort_by( .created_at ) | .[-1] | .status" $TEMP_FILE)
echo "Check suite state: ${STATUS}"

if [ "$STATUS" = "completed" ]; then
    CONCLUSION=$(jq -r ".workflow_runs | sort_by( .created_at ) | .[-1] | .conclusion" $TEMP_FILE)
    LATEST_WF_RUN_ID=$(jq -r ".workflow_runs | sort_by( .created_at ) | .[-1] | .run_number" $TEMP_FILE)
    echo "Check suite conclusion: ${CONCLUSION}"
    echo "Run ID: ${LATEST_WF_RUN_ID}"
    break;
fi