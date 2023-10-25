# get computer name
$ComputerInfo = Get-ComputerInfo

# get disk info
$DiskInfo = Get-Disk

$obj = [PSCustomObject]@{
    Barney = "$($ComputerInfo.CsDNSHostName) Dinosaur"
    HotSauce = $ComputerInfo.OsVersion
    Rollerskates = $DiskInfo.count
}
Write-Output $obj