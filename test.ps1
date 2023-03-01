$parentRelation = "System.LinkTypes.Hierarchy-Forward"
$autoDefectComment= "Created by TR ADO Test Automation"
$json=Get-Content -Raw -Path 'work.json' | Out-String | ConvertFrom-Json
$output = $json.relations | Where-Object ({($_.rel -match $parentRelation) -and ($_.attributes.comment -match $autoDefectComment ) -and ($_.attributes.name -match "child")})
Write-Host $output.url
$existingDefectUrl = $output.url
$existingDefectCount = ($output.url | Measure-Object -Property length -Minimum -Maximum -Sum -Average).Count
Write-Host $existingDefectCount
$getWorkItem = "$adoWorkTrackingItemUrl" + "$project/_apis/wit/workitems/" + $existingBugId + "?api-version=7.0"
$bugUrlArray =$existingDefectUrl.Split(" ")
foreach ( $node in $bugUrlArray )
{
    $bugId = $node.Split('/')[8]
    $existingBugId = $bugId
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    $bugWorkItem = Invoke-RestMethod $getWorkItem -Method GET -ContentType "application/json" -Headers $header
    $bugStatus = $bugWorkItem.fields."System.Reason"
    Write-Host "[$bugId]($node): $bugStatus"
}