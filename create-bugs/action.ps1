#!/usr/bin/env pwsh

##
## This is a sample GitHub Action script written in PowerShell Core.
## You can write your logic in PWSH to perform GitHub Actions.
##


## You interface with the Actions/Workflow system by interacting
## with the environment.  The `GitHubActions` module makes this
## easier and more natural by wrapping up access to the Workflow
## environment in PowerShell-friendly constructions and idioms
if (-not (Get-Module -ListAvailable GitHubActions)) {
    ## Make sure the GH Actions module is installed from the Gallery
    Install-Module GitHubActions -Force
}

## Load up some common functionality for interacting
## with the GitHub Actions/Workflow environment
Import-Module GitHubActions

##
## ***** Put your logic here *****
##

## Pull in some inputs
$organization = Get-ActionInput organization -Required
$project   = Get-ActionInput project -Required
$personalToken   = Get-ActionInput ado_pat -Required
$area_path   = Get-ActionInput area -Required
$assignedTo   = Get-ActionInput assignedTo -Required
$reason   = Get-ActionInput reason -Required
$tags = Get-ActionInput tags -Required
$testRunName = Get-ActionInput testRunName -Required
$workItemType = Get-ActionInput workItemType -Required
$runId = Get-ActionInput runId -Required
$runId = [int]$runId

function GetUrl() {
    param(
        [string]$orgUrl, 
        [hashtable]$header, 
        [string]$AreaId
    )

    # Area ids
    # https://docs.microsoft.com/en-us/azure/devops/extend/develop/work-with-urls?view=azure-devops&tabs=http&viewFallbackFrom=vsts#resource-area-ids-reference
    # Build the URL for calling the org-level Resource Areas REST API for the RM APIs
    $orgResourceAreasUrl = [string]::Format("{0}/_apis/resourceAreas/{1}?api-version=6.0-preview.1", $orgUrl, $AreaId)

    # Do a GET on this URL (this returns an object with a "locationUrl" field)
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $results = Invoke-RestMethod -Uri $orgResourceAreasUrl -Headers $header

    # The "locationUrl" field reflects the correct base URL for RM REST API calls
    if ("null" -eq $results) {
        $areaUrl = $orgUrl
    }
    else {
        $areaUrl = $results.locationUrl
    }

    return $areaUrl
}

$orgUrl = "https://dev.azure.com/$organization"
$area_path = "$project\\$area"
$personalToken = "$personalToken"

Write-Host "Initialize authentication context" -ForegroundColor Yellow
$token = [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes(":$($personalToken)"))
$header = @{authorization = "Basic $token" }

# Projects - List
Write-Host "Getting list of projects" -ForegroundColor Green
$coreAreaId = "79134c72-4a58-4b42-976c-04e7115f32bf"
$adoBaseUrl = GetUrl -orgUrl $orgUrl -header $header -AreaId $coreAreaId

Write-Host "ADO Base URL: $adoBaseUrl"
# https://docs.microsoft.com/en-us/rest/api/azure/devops/core/projects/list?view=azure-devops-rest-5.1
$projectsUrl = "$($adoBaseUrl)_apis/projects?api-version=6.0"
Write-Host "ADO Projects URL: $projectsUrl"

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$projects = Invoke-RestMethod -Uri $projectsUrl -Method Get -ContentType "application/json" -Headers $header

Write-Host "ADO Projects: $projects"


$projects.value | ForEach-Object {
    Write-Host $_.name
}

# Runs - List
Write-Host "Getting list of Test Runs"  -ForegroundColor Green
$projects.value  | ForEach-Object {
    $projectVariable = $_.name
    $testAreaId = "3b95fb80-fdda-4218-b60e-1052d070ae6b"
    $testRunName = "$testRunName" # YOUR testRunName
    $adoBaseUrl = GetUrl -orgUrl $orgUrl -header $header -AreaId $testAreaId

Write-Host "ADO Base URL: $adoBaseUrl"

    #  https://docs.microsoft.com/en-us/rest/api/azure/devops/test/runs/list?view=azure-devops-rest-6.0
    if ($projectVariable -eq $project) {
        $testRunUrl = "$adoBaseUrl/$project/_apis/test/runs?api-version=6.0"
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        $testRunResultsUri = Invoke-RestMethod -Uri $testRunUrl -Method Get -ContentType "application/json" -Headers $header
        $runResultDefs = $testRunResultsUri.value
        if ($runResultDefs.Count -gt 0) {
            Write-Host "$project has $($runResultDefs.count) test runs" -ForegroundColor Blue
            $lastRunResult = $runResultDefs[-1]
            if ($runId -eq '') {
                if ($lastRunResult.name -match $testRunName) {
                    $lastRunId = $lastRunResult.id
                    $lastTestName = $lastRunResult.name
                    Write-Host "Last test run id: " $lastRunId
                    Write-Host "Last test run name: " $lastTestName
                }                
            }
            else {
                $lastRunId = $runId
            }
        }
    }
}

# Get test results for a test run.
Write-Host "Getting passed/failed results from last run" -ForegroundColor Green
$projects.value  | ForEach-Object {
    $projectVariable = $_.name
    $workTrackingAreaId = "85f8c7b6-92fe-4ba6-8b6d-fbb67c809341"
    $workitemType = "$bug"
    $Area = "$area_path"
    $AssignedTo = "$assignedTo"
    $Reason = "$reason"
    $tags = "$tags"
    $adoWorkTrackingItemUrl = GetUrl -orgUrl $orgUrl -header $header -AreaId $workTrackingAreaId
    Write-Host "adoWorkTrackingItemUrl: $adoWorkTrackingItemUrl"
    $script:adoBaseUrl = GetUrl -orgUrl $orgUrl -header $header -AreaId $testAreaId
    Write-Host "adoBaseUrl: $script:adoBaseUrl"

    # https://docs.microsoft.com/en-us/rest/api/azure/devops/test/results/list?view=azure-devops-rest-6.0
    if ($projectVariable -eq $project) {
            $testResultsRunUrl = "$script:adoBaseUrl/$project/_apis/test/Runs/$lastRunId/results?api-version=6.0"
            Write-Host "testResultsRunUrl: $testResultsRunUrl"
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        $lastTestSuiteResult = Invoke-RestMethod $testResultsRunUrl -Method Get -ContentType "application/json" -Headers $header
        $lastTestSuiteScenariosRunResults = $lastTestSuiteResult.value
        if ($lastTestSuiteScenariosRunResults.Count -gt 0) {
            Write-Host "$lastTestName $($lastTestSuiteScenariosRunResults.count) test cases found" -ForegroundColor Blue
            for ($i = 0; $i -lt $lastTestSuiteScenariosRunResults.Count; $i++) {
                $currentTestCase = $lastTestSuiteScenariosRunResults[$i]
                if ($currentTestCase.outcome -ne "Passed") {
                    Write-Host "Creating bug for failed test case" -ForegroundColor Green
                    # https://docs.microsoft.com/en-us/rest/api/azure/devops/wit/work%20items/create?view=azure-devops-rest-6.0
                    $createBugWorkItemUrl = "$adoWorkTrackingItemUrl/$project/_apis/wit/workitems/$workitemType?api-version=6.0"
                    Write-Host "createBugWorkItemUrl: $createBugWorkItemUrl"
                    $resultID = $currentTestCase.id
                    $bodyDesc = "Get full details of error message & stack trace on below link:" + "`n" + "https://{project_url}/_TestManagement/Runs?runId=" + $lastRunId + "&_a=resultSummary&resultId=" + $resultID + " "
                    $err = ""
                    $errLen = $currentTestCase.stackTrace.Length
                    if ($errLen -gt 1) {
                        $err = $currentTestCase.stackTrace -replace '[^a-zA-Z0-9.]', ' '
                    }
                    else {
                        Write-Host "Not enough content in stack trace"
                        $err = $currentTestCase.stackTrace
                    }
                    $body = @"
                    [
                    {
                        "op" : "add",
                        "path" : "/fields/System.Title",
                        "value" : "$($currentTestCase.testCaseTitle) test case failed in build $($currentTestCase.build.name)"
                    },
                    {
                        "op" : "add",
                        "path" : "/fields/System.Reason",
                        "value" : "$($reason)"
                    },
                    {
                        "op" : "add",
                        "path" : "/fields/System.AreaPath",
                        "value" : "$($currentTestCase.project.name)\\$($Area)"
                    },
                    {
                        "op": "add",
                        "path": "/fields/System.AssignedTo",
                        "value": "$($assignedTo)"
                    },
                    {
                        "op": "add",
                        "path": "/fields/System.Description",
                        "value": "$($bodyDesc)"
                    },
                    {
                        "op": "add",
                        "path": "/fields/Microsoft.VSTS.TCM.ReproSteps",
                        "value": "$($err)"
                    },
                    {
                        "op": "add",
                        "path": "/fields/System.Tags",
                        "value": "$($tags)"
                    }
                ] 
"@
                    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
                    $bugWorkItemURI = Invoke-RestMethod $createBugWorkItemUrl -Method POST -ContentType "application/json-patch+json" -Headers $header -Body $body
                    Write-Host "Bug created for failed test case" $bugWorkItemURI.id -ForegroundColor Blue
                }
                else {
                    Write-Host "All Tests Passed"
                }
            }
        }
        else {
            Write-Host "lastTestSuiteScenariosRunResults: 0"
        }
    }
}
