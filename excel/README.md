# cicd_gh-actions-excel-ado-sync

This is a TR Internal GitHub Action Pattern for automatically uploading Excel(xlsx) Test Cases and Test Results from GitHub to Azure DevOps.
we can call this 2 Way Sync or Bi-Directional Sync

PATTERN STATUS: FULLY READY AND FUNCTIONAL

- [x] TC.A3 - Automated Test Case Creation from Excel to ADO
- [x] TR.A7 - Automated Test Case Results from Excel/JUnit XML to ADO - GH Action 
- [x] TR.A7 - Automated Test Case Results from Excel/JUnit XML to ADO - Shell Script (if you choose to run from AWS CodeBuild or From BrowserStack or Azure Pipeline or Jenkins)

## Framework Architecture

<img width="1140" alt="tr-e2e-framework-v1 1" src="https://user-images.githubusercontent.com/86745613/211696318-6971c3f5-1de1-4604-9436-552159485354.png">

![PE DevOps CT - ADO TestPlans Automation-6](https://user-images.githubusercontent.com/86745613/214972586-e3c1b84d-375a-44c3-853e-4b35611c0a53.jpeg)


## Documentation

- [Introduction](./docs/1-Introduction.md)
- [Preparation](./docs/2-Preparation.md)
- [Sample Screenshots](./docs/3-Action-Screenshots.md)
- [Inputs and Outputs](./docs/4-Inputs-Outputs.md)
- [Examples](./docs/5-Examples.md)
- [SpecSync Config Templates](./docs/specsync-templates)
- [SpecSync Documentation](https://specsolutions.gitbook.io/specsync/)

## Sample Project
We have added a Demo Project so it would be easy to learn for you. 

[Playwright Sample Project with Excel Test Cases](./test)

## Support

Please reach out to Platform Engineering DevOps Experience Team

- [Pavan Mudigonda](mailto:nagapavankumar.mudigonda@tr.com)
- [Thej KM](mailto:thejaswini.madappa@tr.com)
