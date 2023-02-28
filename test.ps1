$parentRelation = "System.LinkTypes.Hierarchy-Forward"
$autoDefectComment= "Created by TR ADO Test Automation"
$json=Get-Content -Raw -Path 'work.json' | Out-String | ConvertFrom-Json
$output = $json.relations | Where-Object ({($_.rel -match $parentRelation) -and ($_.attributes.comment -match $autoDefectComment ) -and ($_.attributes.name -match "child")})
Write-Host $output.url
$existingDefectCount = ($output.url | Measure-Object -Property length -Minimum -Maximum -Sum -Average).Count
Write-Host $existingDefectCount