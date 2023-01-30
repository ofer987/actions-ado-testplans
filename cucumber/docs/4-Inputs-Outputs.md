## Inputs

This Action defines the following formal inputs.

| Name | For Pattern(Test Cases / Results) | Required | Default | Description
|-|-|-|-|-|
| **`artifactory_token`**  | Common | true | false | JFROG Artifactory Token is mandatory since SpecSync license is been stored in JFrog Securely.
| **`artifactory_user`**  | Common | true | false | JFROG Artifactory User is mandatory since SpecSync license is been stored in JFrog Securely.
| **`test_cases_sync`**  | Common | true | false | True to enable Test Case Sync. False to disable.
| **`test_results_sync`**  | Common | true | false | True to enable TRX Test Results Sync. False to disable.
| **`ado_pat`**  | Common | true | None | ADO PAT Token. Example ${{ secrets.ADO_PAT }}
| **`ado_project_url`**  | Common | true | None | ADO ORG URL. example https://dev.azure.com/ORG/PROJECT
| **`cucumber_path`**  | Test Cases Sync | true | false | Provide path to folder where features are present.
| **`test_result_run_name`**  | Test Results Sync | conditional | false | GH-Actions-${{ github.run_id }}-${{ env.ENV }} Environment
| **`test_results_attached_files`**  | Test Results Sync | conditional | none | Semicolon separated list of file paths that should be attached to the test run additionally. (e.g. error1.png;error2.log) Wildcards are currently not supported. if you don't specify this then only test result file will be attached. This in turn you need to configure in your Selenium4, WebDriverIO or Playwright so it can output images with that name. 
| **`run_comment`**  | Run Comment | conditional | false | Could provide GitHub Pages URL where your test results are hosted.
| **`run_result_comment`**  | Run Comment | conditional | false | Could provide GitHub Pages URL where your test results are hosted.
## Outputs

Please note enabling **`test_cases_sync`** will create a cucumber branch with feature files updates with work item number as tags and a PR will be created. Which you can use in conjunction with MS Teams Notification Action to ensure your team takes action on PR assigned.

-  **`excel_pr_url`** : PR URL. Example: https://github.com/tr/tech-toc_cucumber-template/pull/12

Please note enabling **`test_results_sync`** will output test run url which you can use in conjunction with MS Teams Notification Action to ensure your team takes action on failed test cases.

-  **`ado_test_run_url`** : Output of Test RUN URL. Example: https://dev.azure.com/tr-ihn-sandbox/Azure-DevOps-Training/_testManagement/runs?_a=runCharts&runId=844
-  **`ado_test_run_id`** : Output of Test RUN ID. Example: 844