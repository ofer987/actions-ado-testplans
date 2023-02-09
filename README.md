# cicd_gh-actions-ado-testplans

This is a TR Internal GitHub Action for Azure DevOps Test and Bug Management Automation to enable Continous Delivery and Testing.

## 1. Framework Architecture

<img width="1140" alt="tr-e2e-framework-v1 1" src="https://user-images.githubusercontent.com/86745613/211696307-1e90e627-1545-43a8-b742-ebc8ab036a9d.png">

![PE DevOps CT - ado](https://user-images.githubusercontent.com/86745613/217792495-a01c3b13-d8d7-443b-b5f2-a66c03a43721.jpeg)

![PE DevOps CT - ADO TestPlans Automation](https://user-images.githubusercontent.com/86745613/216778017-c5b1139e-9a43-4093-8c6c-9ed287bab313.jpeg)

## 2. Cucumber based Patterns

- [Introduction](./cucumber/docs/1-Introduction.md)
- [Preparation](./cucumber/docs/2-Preparation.md)
- [Sample Screenshots](./cucumber/docs/3-Action-Screenshots.md)
- [Inputs and Outputs](./cucumber/docs/4-Inputs-Outputs.md)
- [Examples](./cucumber/docs/5-Examples.md)
- [SpecSync Config Templates](./cucumber/docs/specsync-templates)
- [SpecSync Documentation](https://specsolutions.gitbook.io/specsync/)
- [Demo Selenium C# SpecSync Project](https://github.com/tr/tech_toc-selenium-dotnet-core)
- [Playwright TypeScript Cucumber Sample Project](https://github.com/tr/tech_toc-cucumber-e2e)


## 3. Non-Cucumber based Patterns

- [Introduction](./excel/docs/1-Introduction.md)
- [Preparation](./excel/docs/2-Preparation.md)
- [Sample Screenshots](./excel/docs/3-Action-Screenshots.md)
- [Inputs and Outputs](./excel/docs/4-Inputs-Outputs.md)
- [Examples](./excel/docs/5-Examples.md)
- [SpecSync Config Templates](./excel/docs/specsync-templates)
- [SpecSync Documentation](https://specsolutions.gitbook.io/specsync/)
- [Playwright Sample Project with Excel Test Cases](./excel/test)


## 4. MSTest - with no test cases written
- [MSTest ReadMe](./mstest/README.md)
- [MSTest Sample Project](./mstest/MsTestSample/)
- [MSTest Create Tests Sample Workflow](./.github/workflows/mstest-create-tests.yml)
- [MSTest Push Test Results Sample Workflow](./.github/workflows/mstest-test-results.yml)


## 5. NUnit - with no test cases written
- [NUnit ReadMe](./nunit/README.md)
- [NUnit Sample Project](./nunit/NUnitSample/)
- [NUnit Create Tests Sample Workflow](./.github/workflows/nunit-create-tests.yml)
- [NUnit Push Test Results Sample Workflow](./.github/workflows/nunit-test-results.yml)


## 6. Create Test Plan
- [Create Test Plan ReadMe](./create-test-plan/README.md)
- [Create TestPlan Sample Workflow](./.github/workflows/create-test-plan.yml)

## 7. Create Bugs or Work Items
- [Create Bugs ReadMe](./create-bugs/README.md)
- [Create Bugs Sample Workflow](https://github.com/tr/cicd_gh-actions-ado-testplans/blob/e436e9c41cb2d28c2f5c0d5595468fdfe0c09381/.github/workflows/nunit.yml#L89)


## Support

Please reach out to Platform Engineering DevOps Excellence Team

- [Pavan Mudigonda](mailto:nagapavankumar.mudigonda@tr.com)
- [Thej KM](mailto:thejaswini.madappa@tr.com)
