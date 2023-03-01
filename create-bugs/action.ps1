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
$testRunName = Get-ActionInput testRunName -Required
$runId = Get-ActionInput runId -Required
$runId = [int]$runId
$workItemType = Get-ActionInput workItemType -Required
$area = Get-ActionInput area -Required
$assignedTo = Get-ActionInput assignedTo -Required
$reason = Get-ActionInput reason -Required
$tags = Get-ActionInput tags -Required
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
    $AssignedTo = "${assignedTo}"
    $Reason = "${reason}"
    $AREA_ONLY = "${area}"
    $tags = "${tags}"
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
                    $createBugWorkItemUrl = "$adoWorkTrackingItemUrl" + "$project/_apis/wit/workitems/" + "$" + $workitemType + "?api-version=7.0"
                    Write-Host "createBugWorkItemUrl: $createBugWorkItemUrl"
                    $resultID = $currentTestCase.id
                    $testCaseID = $currentTestCase.testCase.id
                    $getLinkedBugURI = "$adoWorkTrackingItemUrl" + "$project/_apis/wit/workitems/" + $testCaseID + "?%24expand=1" + "&api-version=7.0"
                    Write-Host "getLinkedBugURI: $getLinkedBugURI"
                    $bodyDesc = "Get full details of error message & stack trace on below link:" + "`n" + "https://$adoBaseUrl/$project/_TestManagement/Runs?runId=" + $lastRunId + "&_a=resultSummary&resultId=" + $resultID + " "
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
                        "value" : "$($currentTestCase.testCaseTitle) test case failed in GH Run# $($env:GITHUB_RUN_NUMBER)"
                    },
                    {
                        "op" : "add",
                        "path" : "/fields/System.Reason",
                        "value" : "$($Reason)"
                    },
                    {
                        "op" : "add",
                        "path" : "/fields/System.AreaPath",
                        "value" : "$($currentTestCase.project.name)\\$($AREA_ONLY)"
                    },
                    {
                        "op": "add",
                        "path": "/fields/System.AssignedTo",
                        "value": "$($AssignedTo)"
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
                    },
                    {
                        "op": "add",
                        "path": "/relations/-",
                        "value": {
                        "rel": "System.LinkTypes.Hierarchy-Reverse",
                        "url": "https://dev.azure.com/$organization/_apis/wit/workItems/$testCaseID",
                        "attributes": {
                                        "comment": "Created by TR ADO Test Automation"
                                    }
                                }
                    }
                ] 
"@
                    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
                    Invoke-RestMethod $getLinkedBugURI -Method GET -ContentType "application/json" -Headers $header -outFile work.json
                    $parentRelation = "System.LinkTypes.Hierarchy-Forward"
                    $autoDefectComment= "Created by TR ADO Test Automation"
                    $json=Get-Content -Raw -Path 'work.json' | Out-String | ConvertFrom-Json
                    $outputBug = $json.relations | Where-Object ({($_.rel -match $parentRelation) -and ($_.attributes.comment -match $autoDefectComment ) -and ($_.attributes.name -match "child")})
                    $existingDefectCount = ($outputBug.url | Measure-Object -Property length -Minimum -Maximum -Sum -Average).Count
                    $existingDefectUrl = $outputBug.url
                    if ($existingDefectCount -eq 1 ) {
                        $existingBugId = $existingDefectUrl.url.Split('/')[8]
                        Write-Host "existingBugId: $existingBugId"
                        $getWorkItem = "$adoWorkTrackingItemUrl" + "$project/_apis/wit/workitems/" + $existingBugId + "?api-version=7.0"
                        Write-Host "getWorkItem: $getWorkItem"
                        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
                        $bugWorkItem = Invoke-RestMethod $getWorkItem -Method GET -ContentType "application/json" -Headers $header
                        $bugWorkItemStatus = $bugWorkItem.fields."System.Reason"
                        "Existing bug: [$existingBugId](existingDefectUrl) - $bugWorkItemStatus" >> $env:GITHUB_STEP_SUMMARY            
                        }
                    else {
                        "Multiple Existing Defects found for $testCaseId[https://dev.azure.com/$organization/$project/_testManagement/runs?runId=$lastRunId&_a=resultSummary&resultId=$resultID]" >> $env:GITHUB_STEP_SUMMARY
                        foreach ( $node in $bugUrlArray )
                        {
                            $bugId = $node.url.Split('/')[8]
                            $existingBugId = $bugId
                            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
                            $bugWorkItem = Invoke-RestMethod $getWorkItem -Method GET -ContentType "application/json" -Headers $header
                            $bugStatus = $bugWorkItem.fields."System.Reason"
                            "[$bugId]($node): $bugStatus" >> $env:GITHUB_STEP_SUMMARY
                        }
                    }
                    if ($existingBugId -eq "" -and $bugWorkItemStatus -eq "Done") {
                        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
                        $bugWorkItemURI = Invoke-RestMethod $createBugWorkItemUrl -Method POST -ContentType "application/json-patch+json" -Headers $header -Body $body
                        Write-Host "Bug created for failed test case" $bugWorkItemURI.id -ForegroundColor Blue
                        $bugID = $bugWorkItemURI.id
                        "Failed Test ID: [$testCaseID](https://dev.azure.com/$organization/$project/_testManagement/runs?runId=$lastRunId&_a=resultSummary&resultId=$resultID) Linked with New Bug Id: [$bugID](https://dev.azure.com/$organization/$project/_workitems/edit/$bugID)" >> $env:GITHUB_STEP_SUMMARY
                    }
                    else {
                        Write-Host "Already active bug present for test case: $testCaseId - Bug: $existingBugId"
                    }
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