# cicd_gh-actions-ado-specsync

This pattern is been created to provide a way to automatically upload Cucumber(BDD) Test Cases from GitHub Repo to Azure DevOps TestPlans.  This is to reduce manual efforts involved in manually updating Azure DevOps.
- This workflow triggers only if there is a change made in Feature Files (addition of new files/updates made to existing files)
- Creates test cases in Azure DevOps from specified path of Feature Files (if not already present)
- Updates test cases in Azure DevOps from specified path of Feature Files (if already)
- Test Cases already found will not be created again
- If triggered branch is other than "main" then the updated Feature Files with ADO Test Case ID Tag Number will be commited back in same branch.
- Its recommened you enter user story number as Tag for each scenario in feature files in format @story:XXXX. If you do this we create link between user story and test cases automatically!
- First you need to create Test Plan and a Test Suite.
- If you create test cases for testing a bug fix, then add Tag in format @bug:XXXX. This will link your test cases with respective bug fix id.
- If triggered branch is "main" then the updated Feature Files with ADO Test Case ID Tag Number(@ADO-XXXX) will be commited in a new branch called "cucumber-ado-sync"
- We suggest you to review the commit updated feature files (with ADO Test Case ID Tag Number) to main branch. Alternatively you can automate PR creation merge as well.
- Please note this GitHub Action is made using Enterprise Licensed version of SpecSync Tool (made by Gaspar Nagy who is major contributor for SpecFlow). Current Licenses set to expire on June 25th 2023. 
- For More Details please visit [SpecSync](https://specsolutions.gitbook.io/specsync/)

## Sample Screenshots:
### Screenshot of Feature File before running this GH Action.
<img width="1194" alt="image" src="https://user-images.githubusercontent.com/86745613/182430649-8e1e85d9-6f56-4919-8ce1-40e46a667bed.png">

### Screenshots of Azure DevOps After running this GH Action.
![image](https://user-images.githubusercontent.com/86745613/182430757-0c60b787-8b29-4c05-8816-8335a9387d2b.png)

### Screenshots of Outline Scenario with parameters populated in to Paramater Column in ADO Test Case
![image](https://user-images.githubusercontent.com/86745613/182431044-3c801a36-b2e7-4610-afd1-e1d2094e328a.png)

### Screenshots of test cases with automatically linked to user story and bug
![image](https://user-images.githubusercontent.com/86745613/182431184-5e0f01a8-df6e-4dfe-b3f7-91ff9de88a4e.png)

### Screenshots of cucumber-ado-sync branch 
![image](https://user-images.githubusercontent.com/86745613/182431328-4268da67-a2d8-400d-84ce-5319053a9df8.png)

### Screeshots of Features autopopulated with ADO Test Case ID as Tag (in cucumber-ado-sync branch )
![image](https://user-images.githubusercontent.com/86745613/182431514-f09c0ab1-7d5e-40f9-b454-9a9c1c834440.png)

## Inputs

This Action defines the following formal inputs.

| Name | Required | Default | Description
|-|-|-|-|
| **`ado_pat`**  | true | None | ADO PAT Token
| **`ado_project_url`**  | true | None | ADO ORG URL. example https://dev.azure.com/ORG/PROJECT
| **`area_path`**  | true | None | ADO Area Path. Example: \\Release 1
| **`cucumber_path`**  | true | false | Provide path to folder where features are present.
| **`cucumber_sync_tool_id`**  | true | None | GH-Actions-Sync-${{ github.run_id }}
| **`test_suite_id`**  | true | None | Provide your Test Suite ID.


## Usage

[Example workflow](https://github.com/tr/cicd_gh-actions-cucumber-azure-devops-sync/blob/main/.github/workflows/main.yaml)

```
name: cucumber-ado-sync

on:
  push:
    branches:
      - '**'
    paths-ignore:
      - '**.md'
    tags-ignore:
      - '**'
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Git Repo
        uses: actions/checkout@v3
      - name: Cucumber to ADO Sync
        uses: tr/cicd_gh-actions-ado-specsync@v1.0
        with:
            ado_pat: ${{ secrets.ADO_PAT }}
            ado_project_url: https://dev.azure.com/tr-ihn-sandbox/Azure-DevOps-Training
            ado_area_path: '\\Release 1'
            ado_iteration_path: '\\Sprint 1'
            cucumber_path: features
            test_suite_id: 9830

```
