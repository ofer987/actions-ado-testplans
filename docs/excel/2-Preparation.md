
## 1. Create ADO BOT ACCOUNT

You can create a BOT account using these [instructions](https://identity.int.thomsonreuters.com/documents/creating-bot-identities-fieldglass.pdf). This gives you a service account with an email address and you can use it for things like Azure DevOps access. You'll receive a TR employee ID (e.g. C1234567) and you can use MFA with it, just like your standard TR account. BOT accounts belong to a single TR employee. I don't know if their ownership can be transferred if the employee leaves. The owner of a BOT account has to renew the "contract" for the account every 60 days. 

You can also create a service account [link1](https://identity.int.thomsonreuters.com/documents/Request_Service_account_and_functionalities.pdf), [link2](https://identity.int.thomsonreuters.com/content/topics/governance/page/non_standard_account_management) where you and another person own the account, and the ownership can change if someone leaves the team or the company. This is more flexible than BOT accounts but is more work to set up. My team has a service account with me as the owner and my manager as the co-owner. If either of us leave the team/company, the other can manage the account and transfer co-ownership. I have not used this service account with ADO, so I don't know if there are any limitations. 

>NOTE: You can skip this step if you decide to use your (one of your teammate) existing user account for the Basic + TestPlan access

## 2. Give your BOT Basic + TestPlans Access

If you do not have Azure DevOps Organization setup for your team, refer the [Azure DevOps - Getting Access](https://github.com/tr/tech-toc_live/blob/main/content/non-functional/strategy-planning/work-item-tracking/azure-devops)

If you already have Azure DevOps Organization setup for your team, please talk to your ADO Org Owner to get "Basic + Test Plans" access for your newly created ADO BOT.

>NOTE: You have choice to use BOT Account or an existing user account for the Basic + TestPlan access

## 3. Create ADO PAT Token on GitHub Repo
- First obtain [ADO PAT Token](https://learn.microsoft.com/en-us/azure/devops/organizations/accounts/use-personal-access-tokens-to-authenticate?view=azure-devops&tabs=Windows)
- [Adding secrets for a repository](https://docs.github.com/en/codespaces/managing-codespaces-for-your-organization/managing-encrypted-secrets-for-your-repository-and-organization-for-github-codespaces#adding-secrets-for-a-repository)
- [Adding secrets for an organization](https://docs.github.com/en/codespaces/managing-codespaces-for-your-organization/managing-encrypted-secrets-for-your-repository-and-organization-for-github-codespaces#adding-secrets-for-an-organization)
## 4. Create TestPlan

First Create TestPlan ID and make note of the Test Plan ID.
Step# 1
![Create New Test Plan](./images/create-new-test-plan.jpg)
Step# 2
![Create New Test Plan-Step2](./images/new-test-plan.jpg)
Step# 3
![Create Test Plan-ID](./images/test-plan-id.jpg)

## 5. ADO Test Configuration

We need to create test configuration to define Operating System the test will be running on. This will be used in Parent Level Configuration File.

![ADO Configurations](./images/ado-configurations.jpg)

## 6. Organize Folder Structure
First, we need to organize the folder structure of the EXCEL SHEETS the way we want to see them in ADO Test Plan. Each folder will provision one test suite under specified TestPlan.

<!-- ![Feature Folder Structure](./images/feature-folder-structure.jpg) -->

## 7. Configuration Files

-   **Parent configuration files** Parent config file needs to be located at the Root of your EXCEL folder name "specsync-parent.json". This config has config variables which are common for whole project. We have a [template specsync-common.json](./specsync-templates/parent-level/specsync-parent.json) that you can copy and make changes. [Reference Documentation Located at](https://specsolutions.gitbook.io/specsync/features)
-   **EXCEL File Level (Child) configuration files** EXCEL File Level configuration files need to be located at EXCEL level and has definitions for only feature level specific config. For example if you have different Test Suites for each Excel File. We have a [template specsync-common.json](./specsync-templates/child-level/specsync.json) that you can copy and make changes. [Reference Documentation Located at](https://specsolutions.gitbook.io/specsync/features)

- **Test Results Sync** For making test results sync work we need to have to tweak the RegEx  for Test Case Name Matching in specsync json file.

Note:- To learn more about RegEx or to test your regex rule, you can visit:
* [Microsoft Learn RegEx](https://learn.microsoft.com/en-us/dotnet/standard/base-types/regular-expression-language-quick-reference)
* [regexr.com](https://regexr.com)
* [regex101](https://regex101.com)

We provide you some examples here.

Example 1:- Observe the "Name" key in below json from specsync config file. Here we use cap ^ sign that mean we are forcing strict rule. Only if "Name" of test case is matching with that in Azure DevOps then only we update the test results. Please note if you remove that cap ^ sign there is a chance results get updated to wrong test cases. 

Example 1:- Lets Say your JUnit XML has "name" tag like below

<name>: 'New Todo should allow me to add todo items'


And your Excel sheet has corresponding test cases with exact same 'New Todo should allow me to add todo items'. Then result will get updated.

            "plugins": [
            {
                "packageId": "SpecSync.Plugin.ExcelTestSource",
                "packageVersion": "1.0.0 "        
            },
            {
                "packageId": "SpecSync.Plugin.GenericTestResultMatcher",
                "packageVersion": "1.0.0 ",
                "parameters": {
                "Name": "^{local-test-case-name}$"
                }
            }
            ]

Example 2:- Lets Say your JUnit XML has "Class" tag like below that you want to use instead.


            <className>: '[chromium] › demo-todo-app.spec.ts › New Todo › should allow me to add todo items'

Then you would have ClassName like below. note the sign "›" we are escaping here to do the match.

            "plugins": [
            {
                "packageId": "SpecSync.Plugin.ExcelTestSource",
                "packageVersion": "1.0.0 "        
            },
            {
                "packageId": "SpecSync.Plugin.GenericTestResultMatcher",
                "packageVersion": "1.0.0 ",
                "parameters": {
                "ClassName": "\\› {local-test-case-name}$"
                }
            }
            ]

Example 3:- Lets Say you want to use both "Name" and  "Class" tag like below from your JUnit XML.

Then you would add two parameters.

            <className>: '[chromium] › demo-todo-app.spec.ts › New Todo › should allow me to add todo items'

Then you would have ClassName like below. note the sign "›" we are escaping here to do the match.

            "plugins": [
            {
                "packageId": "SpecSync.Plugin.ExcelTestSource",
                "packageVersion": "1.0.0 "        
            },
            {
                "packageId": "SpecSync.Plugin.GenericTestResultMatcher",
                "packageVersion": "1.0.0 ",
                "parameters": {
                "Name": "^{local-test-case-name}$",
                "ClassName": "\\› {local-test-case-name}$"
                }
            }
            ]



## 8. Create Test Plan ID
Create test plan ID following below screenshot

![Create Test Plan-ID](./images/test-plan-id.jpg)

## 9. Tag User Story and/or Bug Number

- Its recommend you enter user story number as Tag for each scenario in excel files in story tag column name in format "story:12345". Don't put quotes in excel. If you do this we create link between user story and test cases automatically!
- First you need to create Test Plan and a Test Suite.
- If you create test cases for testing a bug fix, then add Tag column. This will link your test cases with respective bug fix id, in format "bug:12345". Don't put quotes in excel. 
- We have Excel Template Folder that you can copy and create your test cases in this format (./excel)

![Story and Bug Tags](./images/story-bug-tags.jpg)

## 10. Create GitHub Teams
This Action creates a PR with updated Excel Feature Files with Azure DevOps Work Item Tag#. So we suggest you to do the following to enable auto assignment of PR to your team members.
- You should create GitHub Teams and enable PR Assignment Rules. Refer [GitHub Teams](https://docs.github.com/en/organizations/organizing-members-into-teams/managing-code-review-settings-for-your-team)
- You should [link your repo to your GitHub Team](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/managing-repository-settings/managing-teams-and-people-with-access-to-your-repository)

## 11. Configuring Triggers for workflows

- Its suggested to configure Test Case Sync workflow with "workflow_dispatch" so you can trigger as and when required. 
- If you want to automate trigger, you can set path to trigger when ".xlsx" files are modified.
- Make sure to exclude PRs of label "excel auto sync" in trigger
- Make sure to exclude Push of tag "excel" in trigger
- If you don't handle above conditions it will create circular workflows being triggered.

