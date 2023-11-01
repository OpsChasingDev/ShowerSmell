# get computer name
$ComputerInfo = Get-ComputerInfo

# get disk info
$DiskInfo = Get-Disk

$obj = [PSCustomObject]@{
    MachineName = $ComputerInfo.CsDNSHostName
    OSVersion = $ComputerInfo.OsVersion
    LogicalDiskCount = $DiskInfo.count
}
Write-Output $obj