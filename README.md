# cicd_gh-actions-cucumber-azure-devops-sync

This pattern is been created to provide a way to automatically upload Cucumber(BDD) Test Cases from GitHub Repo to Azure DevOps TestPlans.  This is to reduce manual efforts involved.

## Sample Screenshots of Test Cases in Azure DevOps after Successful Run:-

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

## Outputs

This Action updates your feature files with ADO Test Case ID as Tag so its suggested to make a commit back to Git Repo  by making a PR

## Usage

Its recommended you to follow this [Example workflow](https://github.com/tr/cicd_gh-actions-cucumber-azure-devops-sync/blob/main/.github/workflows/main.yaml)

