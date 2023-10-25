# get computer name
$ComputerInfo = Get-ComputerInfo | Select-Object CsDNSHostName, OsVersion
$ComputerInfo

# get disk info
$DiskInfo = Get-Disk
$DiskInfo.count