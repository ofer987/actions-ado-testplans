# cicd_gh-actions-cucumber-azure-devops-sync

This pattern is been created to provide a way to automatically upload Cucumber(BDD) Test Cases from GitHub Repo to Azure DevOps TestPlans.  This is to reduce manual efforts involved.

- Creates test cases in Azure DevOps from specified path of Feature Files (if not already present)
- Updates test cases in Azure DevOps from specified path of Feature Files (if already)
- This workflow triggers only if there is a change made in Feature Files (addition of new files/updates made to existing files)
- If triggered branch is other than "main" then the updated Feature Files with ADO Test Case ID Tag Number will be commited back in same branch.
- If triggered branch is "main" then the updated Feature Files with ADO Test Case ID Tag Number will be commited in a new branch called "cucumber-ado-sync"
- We suggest you to review the commit updated feature files (with ADO Test Case ID Tag Number) to main branch. Alternatively you can automate PR creation merge as well.
- you can create Test Plan and Test Suite using the auto created test cases by using Search and Filter

## Sample Screenshots:
### Screenshot of Feature File before running this GH Action.
<img width="922" alt="image" src="https://user-images.githubusercontent.com/86745613/182264815-1b54517d-e2ca-46c6-ad55-810fa0647e17.png">

### Screenshots of Azure DevOps After running this GH Action.
You can filter your test cases using tag entered in GH Action Input Variable **cucumber_sync_tool_id**

<img width="1428" alt="image" src="https://user-images.githubusercontent.com/86745613/182265088-ebfb9d4a-9a64-479c-9f60-ae0c64f935ff.png">

### Screenshots of Test Case Autopopulated through this GH Action
<img width="864" alt="image" src="https://user-images.githubusercontent.com/86745613/182267100-3c0c8a80-d70d-4291-b65a-f71a8af818c7.png">
<img width="994" alt="image" src="https://user-images.githubusercontent.com/86745613/182267121-9e84a890-bd19-4542-83c2-eafbdeb2ca17.png">

### Screenshots of Outline Scenario with parameters populated in to Paramater Column in ADO Test Case
<img width="794" alt="image" src="https://user-images.githubusercontent.com/86745613/182267326-78cde668-5f5d-4fec-870d-78e5a74b7cd2.png">

<img width="758" alt="image" src="https://user-images.githubusercontent.com/86745613/182267277-25fc16c0-9c25-4fc6-954d-3a3d532c97b7.png">


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
| **`cucumber_sync_tool_id`**  | true | None | GH-Actions-Sync-${{ github.run_id }}
| **`tag_prefix_id`**  | false | @ADO- | Pre-fix for ADO Test Case ID Tag


## Usage

Its recommended you to follow this [Example workflow](https://github.com/tr/cicd_gh-actions-cucumber-azure-devops-sync/blob/main/.github/workflows/main.yaml)

