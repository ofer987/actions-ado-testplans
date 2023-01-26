# cicd_gh-actions-cucumber-ado-sync

This is a TR Internal GitHub Action Pattern for automatically uploading Cucumber(BDD) Test Cases and Test Results from GitHub to Azure DevOps.
Please can call this 2 Way Sync or Bi-Directional Sync


PATTERN STATUS: FULLY READY AND FUNCTIONAL

- [x] TC.A2 - Automated Test Case Creation from Cucumber to ADO
- [x] TR.A6 - Automated Test Case Results from Cucumber/Cucumber JSON to ADO - GH Action
- [x] TR.A6 - Automated Test Case Results from Cucumber/Cucumber JSON to ADO - Shell Script (if you choose to run from AWS CodeBuild or From BrowserStack or Azure DevOps Pipelines or Jenkins)

Please also see:
[Excel Patterns](https://github.com/tr/cicd_gh-actions-excel-ado-sync/blob/main/README.md)
- [x] TC.A3 - Automated Test Case Creation from Excel to ADO
- [x] TR.A7 - Automated Test Case Results from Excel/JUnit XML to ADO - GH Action 
- [x] TR.A7 - Automated Test Case Results from Excel/JUnit XML to ADO - Shell Script (if you choose to run from AWS CodeBuild or From BrowserStack or Azure Pipeline or Jenkins)

[Additional Patterns](https://github.com/tr/cicd_gh-actions-ado-testplans-sync)
- TP.A1 - Create Test Plan Automatically in ADO
Non-BDD Framework
- TC.A4 - Test Case Syncronization from MS Test Framework in to ADO TestPlans
- TC.A5 - Test Case Syncronization from NUnit Framework in to ADO TestPlans
- TR.A8 - Test Results Syncronization from MS Test Framework in to ADO TestPlans
- TR.A9 - Test Results Syncronization from NUnit Framework in to ADO TestPlans
- BG.A - Automated Bug Creation workflow from latest run or by specifying ADO Run ID you got from "TR.A" Patterns

## Framework Architecture

<img width="1140" alt="tr-e2e-framework-v1 1" src="https://user-images.githubusercontent.com/86745613/211696307-1e90e627-1545-43a8-b742-ebc8ab036a9d.png">

![PE DevOps CT - ADO TestPlans Automation-6](https://user-images.githubusercontent.com/86745613/214972549-8b8ea766-3fd0-4611-96a2-19baebb06ea0.jpeg)


## Documentation

- [Introduction](./docs/1-Introduction.md)
- [Preparation](./docs/2-Preparation.md)
- [Sample Screenshots](./docs/3-Action-Screenshots.md)
- [Inputs and Outputs](./docs/4-Inputs-Outputs.md)
- [Examples](./docs/5-Examples.md)
- [SpecSync Config Templates](./docs/specsync-templates)
- [SpecSync Documentation](https://specsolutions.gitbook.io/specsync/)

## Demo Project

We have demo projects that you refer to learn from:
* [Demo Selenium C# SpecSync Project](https://github.com/tr/tech_toc-selenium-dotnet-core)
* [Playwright TypeScript Cucumber](https://github.com/tr/tech_toc-cucumber-e2e)

## Support

Please reach out to Platform Engineering DevOps Experience Team

- [Pavan Mudigonda](mailto:nagapavankumar.mudigonda@tr.com)
- [Thej KM](mailto:thejaswini.madappa@tr.com)
