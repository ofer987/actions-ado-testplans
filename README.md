# cicd_gh-actions-cucumber-azure-devops-sync

This pattern is been created to provide a way to automatically upload Cucumber(BDD) Test Cases from GitHub Repo to Azure DevOps TestPlans.  This is to reduce manual efforts involved.

- Creates test cases in Azure DevOps from specified path of Feature Files (if not already present)
- Updates test cases in Azure DevOps from specified path of Feature Files (if already)
- This workflow triggers only if there is a change made in Feature Files (addition of new files/updates made to existing files)
- If triggered branch is other than "main" then the updated Feature Files with ADO Test Case ID Tag Number will be commited back in same branch.
- If triggered branch is "main" then the updated Feature Files with ADO Test Case ID Tag Number will be commited in a new branch called "cucumber-ado-sync"
- We suggest you to review the commit updated feature files (with ADO Test Case ID Tag Number) to main branch. Alternatively you can automate PR creation merge as well.

## Sample Screenshots:
### Screenshot of Feature File before running this GH Action.
<img width="922" alt="image" src="https://user-images.githubusercontent.com/86745613/182264815-1b54517d-e2ca-46c6-ad55-810fa0647e17.png">

### Screenshots of Azure DevOps After running this GH Action.
You can filter your test cases using tag entered in GH Action Input Variable **cucumber_sync_tool_id**

<img width="1428" alt="image" src="https://user-images.githubusercontent.com/86745613/182265088-ebfb9d4a-9a64-479c-9f60-ae0c64f935ff.png">

### Screenshots of Feature Files with ADO Test Case ID populated as Tag ID

<img width="1022" alt="image" src="https://user-images.githubusercontent.com/86745613/182265412-5636c25d-7ebb-4771-a644-258fe2e26961.png">

## Inputs

This Action defines the following formal inputs.

| Name | Required | Default | Description
|-|-|-|-|
| **`ado_pat`**  | true | None | ADO PAT Token
| **`ado_org_url`**  | true | None | ADO ORG URL
| **`project_name`**  | true | None | ADO Project Name you want the test cases to be uploaded under
| **`feature_path`**  | true | None | Path of Cucumber Gherkins Style Features
| **`area_path`**  | true | None | ADO Area Path
| **`set_then_steps_as_expected`**  | true | false | Setting true will copy Then Statements to exected result column
| **`cucumber_sync_tool_id`**  | true | None | GH-Actions-Sync
| **`tag_prefix_id`**  | false | @ADO- | ADO PAT Token


## Usage

Its recommended you to follow this [Example workflow](https://github.com/tr/cicd_gh-actions-cucumber-azure-devops-sync/blob/main/.github/workflows/main.yaml)

