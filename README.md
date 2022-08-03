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
- If triggered branch is "main" then the updated Feature Files with ADO Test Case ID Tag Number(@ADO:XXXX) will be commited in a new branch called "cucumber-ado-sync"
- We suggest you to review the commit updated feature files (with ADO Test Case ID Tag Number) to main branch. Alternatively you can automate PR creation merge as well.
- Please note this GitHub Action is made using Enterprise Licensed version of SpecSync Tool (made by Gaspar Nagy who is major contributor for SpecFlow). Current Licenses set to expire on June 25th 2023. 
- For More Details please visit [SpecSync](https://specsolutions.gitbook.io/specsync/)
- Please note current licenses for SpecSync allows only 30 runs at a time so if you face error due excess usage we suggest you to attempt to run after 5 mins. This can be configured using Github Actions workflows.

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

### Screenshos after running Test Results GH Action
<img width="1426" alt="image" src="https://user-images.githubusercontent.com/86745613/182665218-f740bd5f-ed93-422d-a21e-98f11284c5c1.png">
<img width="1414" alt="image" src="https://user-images.githubusercontent.com/86745613/182665251-c04cc4c0-fe8c-41f7-b74d-8b80d9af225c.png">
<img width="1413" alt="image" src="https://user-images.githubusercontent.com/86745613/182665349-b0a1ae95-c93d-4e3a-bb06-7b98aaff8261.png">
<img width="1432" alt="image" src="https://user-images.githubusercontent.com/86745613/182665447-b2728c10-a64d-4a93-9be5-5edbb0687939.png">
<img width="1435" alt="image" src="https://user-images.githubusercontent.com/86745613/182665492-b85695e6-3bb8-4348-bccd-308f653ef3c2.png">

## Inputs

This Action defines the following formal inputs.

| Name | For Pattern(Test Cases / Results) | Required | Default | Description
|-|-|-|-|-|
| **`test_cases_sync`**  | Common | true | true | True to enable Test Case Sync. False to disable.
| **`test_results_sync`**  | Common | true | false | True to enable TRX Test Results Sync. False to disable.
| **`ado_pat`**  | Common | true | None | ADO PAT Token
| **`ado_project_url`**  | Common | true | None | ADO ORG URL. example https://dev.azure.com/ORG/PROJECT
| **`area_path`**  | Common | true | None | ADO Area Path. Example: \\Release 1
| **`cucumber_path`**  | Test Cases Sync | true | false | Provide path to folder where features are present.
| **`ado_iteration_path`**  | Common | true | None | ADO Iteration Path. Example: \\Sprint 1
| **`test_suite_id`**  | Test Cases Sync | true | None | Provide your Test Suite ID. Either test_suite_id or test_suite_name to be entered but not both.
| **`test_suite_name`**  | Test Cases Sync | true | None | Provide your Test Suite Name. Either test_suite_id or test_suite_name to be entered but not both.
| **`test_case_tag_prefix`**  | Test Cases Sync | true | ADO | Test Case Tag Prefix. Default will populate as @ADO:XXXX
| **`cucumber_language`**  | Test Cases Sync | true | en-US | Defaults to en-US. Please refer [Ubuntu Manpages](https://manpages.ubuntu.com/manpages/bionic/man3/DateTime::Locale::Catalog.3pm.html) for valid codes. Cucumber supported [Localisation Language](https://cucumber.io/docs/gherkin/languages/)
| **`test_configuration_name`**  | Test Results Sync | false | ${{ runner.os }}-${{ runner.arch }} | The name of the test configuration. Default will detect automatically example Ubuntu-X64 or Windows-X64. Make sure create this config in Azure DevOps.
| **`test_configuration_id`**  | Test Results Sync | false | - | The ID of the test configuration.
| **`test_result_file_path`**  | Test Results Sync | false | - | The path of the test result file (e.g. TRX) file or a folder containing multiple test result files.
| **`test_result_file_format`**  | Test Results Sync | false | - | The format of the test result file. Please check the Compatibility page for [supported formats](https://specsolutions.gitbook.io/specsync/reference/compatibility#supported-test-result-formats). 
| **`test_result_run_comment`**  | Test Results Sync | false |  GH Action-${{ github.run_id}} | The comment of the created Test Run.
| **`test_result_run_name`**  | Test Results Sync | false | false | GH-Actions-${{ github.run_id }}
| **`test_result_run_type`**  | Test Results Sync | false | automated | Sets the run type of the created Test Run. Possible values: automated, manual.
| **`test_result_run_result_comment`**  | Test Results Sync | false | As Expected | The comment added to the individual test results within the created Test Run.
| **`test_result_test_suite_name`**  | Test Results Sync | false | - |Specifies a test suite within the Azure DevOps project to publish the test results for.The name of the test suite. For suites with non-unique names, please use the testSuite/id setting.
| **`test_result_test_suite_id`**  | Test Results Sync | false | - | Specifies a test suite within the Azure DevOps project to publish the test results for. The ID of the test suite as a number (e.g. id: 12345).
| **`test_result_test_plan_id`**  | Test Results Sync | false | - | The ID of the test plan to search or create the test suite in. (Optional, improves performance)
| **`test_result_create_sub_results`**  | Test Results Sync | false | false | Enables publishing scenario outline iteration results as sub-results. Sub-results are not displayed in the Azure DevOps user interface but can be retrieved through the API. The scenario outline iteration results are published as iteration results (displayed on the user interface) regardless of this setting.
| **`test_result_treat_inconclusive_as`**  | Test Results Sync | false | NotExecuted | Maps the Inconclusive test results. Some test execution frameworks report skipped scenarios as Inconclusive, so they should be mapped to another value, e.g. NotExecuted or Failed.

## Usage

[Test Cases Sync - Example workflow](https://github.com/tr/cicd_gh-actions-cucumber-azure-devops-sync/blob/main/.github/workflows/main.yaml)

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


[Test Results Sync - Example workflow](https://github.com/tr/tech_toc-selenium4-cucumber-sample/blob/main/.github/workflows/main.yml)

```
name: CI
on:
  workflow_run:
    workflows: ["cucumber-ado-sync"]
    types: [completed]
    branches:
      - '**'
  push:
    branches:
      - '**'
    paths-ignore:
      - '**.md'
    tags-ignore:
      - '**'
jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      # Check out repo at latest commit
      - name: Checkout Git Repo
        uses: actions/checkout@v2
        with:
          fetch-depth: 0
          ref: ${{ github.ref_name }}

      - name: Set up .NET 6
        uses: actions/setup-dotnet@v2
        with:
          dotnet-version: "6.0.104"
          
      - name: Build with Dotnet
        shell: sh
        run: |
          cd webapp;
          dotnet build;
      - name: DOTNET Test
        shell: sh
        run: |
          cd webapp;
          dotnet test --logger "trx;LogFileName=test-results.trx";          

      - name: Cucumber to ADO Test Results Sync
        if: always()
        uses: tr/cicd_gh-actions-ado-specsync@v1.0
        with:
          test_cases_sync: false
          test_results_sync: true
          ado_pat: ${{ secrets.ADO_PAT }}
          ado_area_path: '\\Release 1'
          ado_iteration_path: '\\Sprint 1'
          ado_project_url: https://dev.azure.com/tr-ihn-sandbox/Azure-DevOps-Training
          test_results_file_path: './webapp/SpecFlowCalculator.Specs/TestResults/test-results.trx'
          test_results_file_format: 'TRX'
          test_suite_id: 9831
          test_results_test_suite_id: 9831
          test_results_test_plan_id: 185

```          
