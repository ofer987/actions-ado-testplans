# cicd_gh-actions-cucumber-ado-sync

This is a TR Internal GitHub Action Pattern for automatically uploading Cucumber(BDD) Test Cases and Test Results from GitHub to Azure DevOps.
Please can call this 2 Way Sync or Bi-Directional Sync


PATTERN STATUS: FULLY READY AND FUNCTIONAL

- [x] Automated Test Case Creation from Cucumber to ADO
- [x] Automated Test Case Results from Cucumber/Cucumber JSON to ADO - GH Action
- [x] Automated Test Case Results from Cucumber/Cucumber JSON to ADO - Shell Script (if you choose to run from AWS CodeBuild or From BrowserStack or Azure DevOps Pipelines or Jenkins)

## Framework Architecture

<img width="1140" alt="tr-e2e-framework-v1 1" src="https://user-images.githubusercontent.com/86745613/211696307-1e90e627-1545-43a8-b742-ebc8ab036a9d.png">

![PE DevOps CT - ADO TestPlans Automation](https://user-images.githubusercontent.com/86745613/213462737-2d67de7a-f01f-47cc-9dca-89df9f0296d1.jpeg)


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
