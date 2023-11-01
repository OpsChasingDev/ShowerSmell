# get computer name
$ComputerInfo = Get-ComputerInfo

# get disk info
$DiskInfo = Get-Disk

# get free system space
$FreeSpace = Get-PSDrive | Where-Object {$_.Name -eq 'C'}

$obj = [PSCustomObject]@{
    MachineName = $ComputerInfo.CsDNSHostName
    OSVersion = $ComputerInfo.OsVersion
    LogicalDiskCount = $DiskInfo.count
    FreeSpace_GB = [System.Math]::Round(($FreeSpace.Free / 1gb),1)
}
Write-Output $obj