This pattern is been created to provide a way to automatically upload Cucumber(BDD) Test Cases and Test Results from GitHub to Azure DevOps TestPlans.  This is to reduce efforts involved in manually updating Azure DevOps.

- This workflow triggers only if there is a change made in Feature Files (addition of new files/updates made to existing files)
- Creates test cases in Azure DevOps from specified path of Feature Files (if not already present)
- Updates test cases in Azure DevOps from specified path of Feature Files (if already)
- Test Cases already found will not be created again
- If triggered branch is other than "main" then the updated Feature Files with ADO Test Case ID Tag Number will be committed back in same branch.
- This Action will update work item tags to your feature files and will be committed back to your main branch via Auto PR Process.
- Please note this GitHub Action is made using Enterprise Licensed version of SpecSync Tool (made by Gaspar Nagy who is major contributor for SpecFlow). Current Licenses set to expire on June 25th 2023. 
- For More Details please visit [SpecSync](https://specsolutions.gitbook.io/specsync/)
- Please note current licenses for SpecSync allows only 30 runs at a time so if you face error due excess usage we suggest you to attempt to run again immediately. This can be configured using Github Actions workflows.
- Please note this Action is been written to work in Ubunbtu Runner only!