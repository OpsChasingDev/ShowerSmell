# get computer name
$ComputerInfo = Get-ComputerInfo

# get disk info
$DiskInfo = Get-Disk

$obj = [PSCustomObject]@{
    ComputerName = $ComputerInfo.CsDNSHostName
    OsVersion = $ComputerInfo.OsVersion
    LogicalDiskCount = $DiskInfo.count
}
Write-Output $obj