# get computer name
$ComputerInfo = Get-ComputerInfo

# get disk info
$DiskInfo = Get-Disk

# get free system space
$FreeSpace = Get-PSDrive | Where-Object { $_.Name -eq 'C' }

# get number of cores
$CPUCore = Get-CimInstance CIM_Processor

# get total memory capacity
$Memory = Get-CimInstance CIM_PhysicalMemory
$MemorySum = 0
foreach ($item in $Memory) {
    $MemorySum += $item.Capacity
}
 
$obj = [PSCustomObject]@{
    MachineName      = $ComputerInfo.CsDNSHostName
    OSVersion        = $ComputerInfo.OsVersion
    LogicalDiskCount = $DiskInfo.count
    FreeSpace_GB     = [System.Math]::Round(($FreeSpace.Free / 1gb), 1)
    CPUCore          = $CPUCore.NumberOfCores
    TotalMemory      = $MemorySum / 1gb
}
Write-Output $obj