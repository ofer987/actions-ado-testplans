1) Automation Service that will create bugs for Azure DevOps Test Runs. 
2) Service will accept the array of run ids, parses the test results. 
- if test is passed do not create bugs.
- create bug if there is no active defect associated to the test case that failed
- 