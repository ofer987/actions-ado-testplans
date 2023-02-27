$parentRelation = 'System.LinkTypes.Hierarchy-Forward'
$findExistingBugs = Get-Content -Path work.json | ConvertFrom-Json | Where-Object { ($_.relations.rel -match $parentRelation) -and ($_.relations.attributes.comment -match "Created by TR ADO Test Automation")}
$existingBugId = $findExistingBugs.id
Write-Host "Existing bug: $existingBugId"