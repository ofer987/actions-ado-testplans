# Create Bugs

This custom workflow examines the last test run id using the Run ID or Run Name Input and creates bugs automatically for the failures in Azure DevOps


## Samples

Here's a quick example of how to use this action in your own GitHub Workflows.

[Sample Create Bugs Workflow]([./github/create-bugs.yml](https://github.com/tr/cicd_gh-actions-ado-testplans/blob/e436e9c41cb2d28c2f5c0d5595468fdfe0c09381/.github/workflows/nunit.yml#L89))

### Inputs

This Action defines the following formal inputs.

| Name | Req | Description
|-|-|-|
| **`ado_pat`**  | true | ADO PAT TOKEN SECRET
| **`organization`**  | true | ADO Organization. Example "tr-cornerstone"
| **`project`**  | true | ADO Project name "sample-project"
| **`reason`**  | true | "New defect reported" or "Build Failure". Please double check your valid values
| **`tags`**  | false | Default tags are workflow name, workflow id, Automated
| **`workItemType`**  | true | Bug, Task, Product Backlog Item. Defaults to Bug
| **`area`**  | true | Area excluding the project name.
| **`assignedTo`**  | true | Name of the person being assigned to
| **`testRunName`**  | conditional | Name of test run.
| **`runId`**  | conditional | Run Id.


### Outputs

Failed Test Case ID, Test Run URL along with corresponding Bug ID and Bug URL will be printed on Summary as below.

<img width="830" alt="image" src="https://user-images.githubusercontent.com/86745613/222991548-bc9fb791-2cbe-4345-beec-4484417d4309.png">



