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
| **`area_path`**  | Common | false | None | ADO Area Path. Example: \\Release 1 or \\PRODUCT_NAME
| **`cucumber_path`**  | Test Cases Sync | true | false | Provide path to folder where features are present.
| **`ado_iteration_path`**  | Common | false | None | ADO Iteration Path. Example: \\Sprint 1 or \\BUSINESS_FUNCTION
| **`test_suite_id`**  | Common | conditional | None | Provide your Test Suite ID. Either test_suite_id or test_suite_name to be entered but not both.
| **`test_suite_name`**  | Test Cases Sync | conditional | None | Provide your Test Suite Name. Either test_suite_id or test_suite_name to be entered but not both.
| **`test_case_tag_prefix`**  | Test Cases Sync | false | ADO | Test Case Tag Prefix. Default will populate as @TC:XXXX
| **`cucumber_language`**  | Test Cases Sync | false | en-US | Defaults to en-US. Please refer [Ubuntu Manpages](https://manpages.ubuntu.com/manpages/bionic/man3/DateTime::Locale::Catalog.3pm.html) for valid codes. Cucumber supported [Localisation Language](https://cucumber.io/docs/gherkin/languages/)
| **`attachments_base_folder`**  | Test Case Sync | conditional | NotExecuted | Provide base folder location for attachments that you would like to upload to each test case. Make sure tag is added to each test case @attachments: TC1_request.json TC1_expected_response.json. [Reference Link](https://specsolutions.gitbook.io/specsync/features/push-features/attach-files)
| **`disable_feature_file_auto_updates`**  | Test Cases Sync | conditional | false | Set "true" if you want to disable auto updates to feature files with test case tag ids ?
| **`skip_scenario_prefix_title`**  | Test Cases Sync | conditional | false | Set "true" if you want to skip adding Scenario or Scenario Outline Prefix title to Test Cases ?
| **`test_configuration_name`**  | Test Results Sync | conditional | ${{ runner.os }}-${{ runner.arch }} | The name of the test configuration. Default will detect automatically example Ubuntu-X64 or Windows-X64. Make sure create this config in Azure DevOps before running test results GH action.
| **`test_configuration_id`**  | Test Results Sync | conditional | - | The ID of the test configuration.
| **`test_result_file_path`**  | Test Results Sync | conditional | - | The path of the test result file (e.g. TRX) file or a folder containing multiple test result files.
| **`test_result_file_format`**  | Test Results Sync | false | - | The format of the test result file. Please check the Compatibility page for [supported formats](https://specsolutions.gitbook.io/specsync/reference/compatibility#supported-test-result-formats). 
| **`test_result_run_comment`**  | Test Results Sync | conditional |  GH Action-${{ github.run_id}} | The comment of the created Test Run.
| **`test_result_run_name`**  | Test Results Sync | conditional | false | GH-Actions-${{ github.run_id }}
| **`test_result_run_type`**  | Test Results Sync | conditional | automated | Sets the run type of the created Test Run. Possible values: automated, manual.
| **`test_result_run_result_comment`**  | Test Results Sync | conditional | As Expected | The comment added to the individual test results within the created Test Run.
| **`test_result_test_suite_name`**  | Test Results Sync | conditional | - |Specifies a test suite within the Azure DevOps project to publish the test results for.The name of the test suite. For suites with non-unique names, please use the testSuite/id setting.
| **`test_suite_id`**  | Test Results Sync | conditional | - | Specifies a test suite within the Azure DevOps project to publish the test results for. The ID of the test suite as a number (e.g. id: 12345).
| **`test_result_test_plan_id`**  | Test Results Sync | conditional | - | The ID of the test plan to search or create the test suite in. (Optional, improves performance)
| **`test_result_create_sub_results`**  | Test Results Sync | conditional | false | Enables publishing scenario outline iteration results as sub-results. Sub-results are not displayed in the Azure DevOps user interface but can be retrieved through the API. The scenario outline iteration results are published as iteration results (displayed on the user interface) regardless of this setting.
| **`test_result_treat_inconclusive_as`**  | Test Results Sync | conditional | NotExecuted | Maps the Inconclusive test results. Some test execution frameworks report skipped scenarios as Inconclusive, so they should be mapped to another value, e.g. NotExecuted or Failed.
| **`test_results_attached_files`**  | Test Results Sync | conditional | none | Semicolon separated list of file paths that should be attached to the test run additionally. (e.g. error1.png;error2.log) Wildcards are currently not supported. if you don't specify this then only test result file will be attached. This in turn you need to configure in your Selenium4, WebDriverIO or Playwright so it can output images with that name. 

## Outputs

Please note enabling **`test_cases_sync`** will output updated feature files will tags added for newly created test cases.
- If triggered branch is other than "main" then the updated Feature Files with ADO Test Case ID Tag Number will be commited back in same branch.
- If triggered branch is "main" then the updated Feature Files with ADO Test Case ID Tag Number(@TC:XXXX) will be commited in a new branch called "cucumber-ado-sync". you need to delete branch cucumber-ado-sync after doing merge.


Please note enabling **`test_results_sync`** will output test run url which you can use in conjuction with MS Teams Notification Action

-  **`ado_test_run_url`** : Output of Test RUN URL. Example: https://dev.azure.com/tr-ihn-sandbox/Azure-DevOps-Training/_testManagement/runs?_a=runCharts&runId=844
-  To consume this you will be using like ${{ steps.ado_test_results_specsync.outputs.ado_test_run_url }}