# Write your code here

$resourceGroupName = "mate-azure-task-5"
$allDisks = Get-AzDisk -ResourceGroupName $resourceGroupName

$unattachedDisks = $allDisks | Where-Object {
    (-not $_.ManagedBy -or $_.DiskState -eq 'Unattached') -and
    ($_.OsType -eq $null)
}

@($unattachedDisks) | ConvertTo-Json -Depth 10 | Out-File -FilePath "result.json" -Encoding utf8

