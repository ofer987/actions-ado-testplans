# Create TestPlan

This custom workflow creates TestPlan in Azure DevOps


## Samples

Here's a quick example of how to use this action in your own GitHub Workflows.
[Sample Create Test Plan Workfow](./.github/workflows/create-test-plan.yml)

### Inputs

This Action defines the following formal inputs.

### Inputs

This Action defines the following formal inputs.

| Name | Req | Description
|-|-|-|
| **`ado_pat`**  | true | ADO PAT TOKEN
| **`organization`**  | true | ADO Organization. Example "tr-cornerstone"
| **`project`**  | true | ADO Project name "sample-project"
| **`area`**  | true | Area excluding the project name
| **`iteration`**  | true | Iteration with out project name
| **`name`**  | true | test plan name
| **`startDate`**  | false | Start Date
| **`endDate`**  | false | End Date


### Outputs

This Action defines the following formal outputs.

| Name | Description
|-|-|


