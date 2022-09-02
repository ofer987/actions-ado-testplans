
## Usage

[Test Cases Sync - Example workflow](https://github.com/tr/cicd_gh-actions-cucumber-azure-devops-sync/blob/main/.github/workflows/main.yaml)

```
name: cucumber-ado-sync

on:
  push:
    branches:
      - '**'
    paths:
      - '**.feature'
    tags-ignore:
      - '**'
  pull_request:
    types:
      - opened
    branches:
      - '**'
    paths:
      - '**.feature'
      
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Git Repo
        uses: actions/checkout@v3
      - name: Cucumber to ADO Sync
        id: ado_test_cases_specsync
        uses: tr/cicd_gh-actions-ado-specsync@v1.0
        with:
            artifactory_token: ${{ secrets.artifactory_token }}
            artifactory_user: ${{ secrets.artifactory_user }}
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
        id: ado_test_results_specsync
        if: always()
        uses: tr/cicd_gh-actions-ado-specsync@v1.0
        with:
          artifactory_token: ${{ secrets.artifactory_token }}
          artifactory_user: ${{ secrets.artifactory_user }}        
          test_cases_sync: false
          test_results_sync: true
          ado_pat: ${{ secrets.ADO_PAT }}
          ado_area_path: '\\Release 1'
          ado_iteration_path: '\\Sprint 1'
          ado_project_url: https://dev.azure.com/tr-ihn-sandbox/Azure-DevOps-Training
          test_results_file_path: './webapp/SpecFlowCalculator.Specs/TestResults/test-results.trx'
          test_results_file_format: 'TRX'
          test_suite_id: 9831
          test_results_test_plan_id: 185

```          
