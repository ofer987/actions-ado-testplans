
## Usage

### 1. Test Cases Sync

[Test Cases Sync - Example workflow](https://github.com/tr/cicd_gh-actions-cucumber-azure-devops-sync/blob/main/.github/workflows/main.yaml)

```
name: cucumber

on:
  workflow_dispatch:
      
jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout Git Repo
        uses: actions/checkout@v3
      - name: Cucumber to ADO Sync
        id: ado_sync
        uses: tr/cicd_gh-actions-cucumber-ado-sync/cucumber@v1.3
        with:
            test_cases_sync: 'true'
            test_results_sync: 'false'
            artifactory_user: ${{ secrets.ARTIFACTORY_USER }}
            artifactory_token: ${{ secrets.ARTIFACTORY_TOKEN }}
            ado_pat: ${{ secrets.ADO_PAT }}
            ado_project_url: https://dev.azure.com/tr-ihn-sandbox/Azure-DevOps-Training
            cucumber_path: features

      - name: MS Teams Notify
        if: ${{ always() }}
        uses: tr/cicd_gh-actions-notification@v1.0
        with:
          WEBHOOK_URL: ${{ secrets.MS_TEAMS_HOOK }}
          WEBHOOK_TYPE: TEAMS
          TEST_ENV: "ADO"
          CICD_WORKFLOW_VERSION: 1
          LINK1_NAME: "View Cucumber PR"
          LINK1_URL: "${{ steps.ado_sync.outputs.cucumber_pr_url }}"
```
### 2. Test Results Sync

Note:- In Order to execute this action and post results to ADO you need to merge the Cucumber branch that has Work item tag numbers.

[Test Results Sync - Example workflow](https://github.com/tr/tech_toc-selenium4-cucumber-sample/blob/main/.github/workflows/main.yml)

```
name: Test 

env:
  CI: true
  DEBUG: pw:api

on:
  workflow_dispatch:
    
jobs:

  run:
    strategy: 
      matrix:
        node: [ '18' ]
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    - uses: actions/setup-node@v3
      with:
        node-version: ${{ matrix.node }}

    - name: npm ci
      run: npm ci

    - name: install Playwright
      run: |
        mkdir reports
        npx playwright install --with-deps

    - name: run features
      run: npm run test

    - name: Cucumber to ADO Test Results Sync
      id: ado_sync
      uses: tr/cicd_gh-actions-ado-testplans/cucumber@v1.3
      with:
        ado_pat: ${{ secrets.ADO_PAT }}
        artifactory_token: ${{ secrets.ARTIFACTORY_TOKEN }}
        artifactory_user: ${{ secrets.ARTIFACTORY_USER }}
        test_cases_sync: false
        test_results_sync: true
        cucumber_path: samples
        test_results_path: ${{github.workspace}}/${{ env.TEST_RESULTS_FOLDER }}/results.json
        test_results_config: ../../${{ runner.os }}-${{ runner.arch }}
        test_results_format: cucumberJson
        test_results_attached_files: false
        ado_project_url: https://dev.azure.com/tr-ihn-sandbox/Azure-DevOps-Training

    - name: MS Teams Notify
      if: ${{ always() }}
      uses: tr/cicd_gh-actions-notification@v1.0
      with:
        WEBHOOK_URL: ${{ secrets.MS_TEAMS_HOOK }}
        WEBHOOK_TYPE: TEAMS
        TEST_ENV: "QA"
        CICD_WORKFLOW_VERSION: 1
        LINK1_NAME: "View HTML Test Results"
        LINK1_URL: "${{env.GH_PAGES_URL}}${{ github.run_number }}/index.html"
        LINK2_NAME: "View ADO Test Run"
        LINK2_URL: "${{ steps.ado_sync.outputs.ADO_RUN_URL }}"
```          
