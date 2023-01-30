# Create Bugs

This custom workflow examines the last test run id using the Run ID or Run Name Input and creates bugs automatically for the failures in Azure DevOps


## Samples

Here's a quick example of how to use this action in your own GitHub Workflows.

[Sample Create Bugs Workflow](./github/create-bugs.yml)

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

<img width="993" alt="image" src="https://user-images.githubusercontent.com/86745613/215378111-2c8e179f-8a6a-432d-a6a5-61ee55a3504f.png">





