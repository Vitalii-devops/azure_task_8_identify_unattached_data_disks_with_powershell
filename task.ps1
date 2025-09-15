# Write your code here

$resourceGroupName = "mate-azure-task-5"
$allDisks = Get-AzDisk -ResourceGroupName $resourceGroupName

$unattachedDisks = $allDisks | Where-Object { -not $_.ManagedBy }

$unattachedDisks | ConvertTo-Json -Depth 5 | Out-File -FilePath "result.json" -Encoding utf8
