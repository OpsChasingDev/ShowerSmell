# get computer name
$ComputerInfo = Get-ComputerInfo | Select-Object CsDNSHostName, OsVersion

# get disk info
$DiskInfo = Get-Disk

$obj = [PSCustomObject]@{
    LogicalDiskCount = $DiskInfo.count
}
Write-Output $obj