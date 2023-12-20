[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [ValidateSet('C','D','G')]
    [string]
    $DriveLetter,

    [Parameter(Mandatory)]
    [int]
    $DriveSpaceRounding
)

# get computer name
$ComputerInfo = Get-ComputerInfo

# get disk info
$DiskInfo = Get-Disk

# get free system space
$FreeSpace = Get-PSDrive -Name $DriveLetter

# get number of cores
$CPUCore = Get-CimInstance CIM_Processor

# get total memory capacity
$Memory = Get-CimInstance CIM_PhysicalMemory
$MemorySum = 0
foreach ($item in $Memory) {
    $MemorySum += $item.Capacity
}
 
# combine the informatio nto a custom object and write to output
$obj = [PSCustomObject]@{
    MachineName      = $ComputerInfo.CsDNSHostName
    OSVersion        = $ComputerInfo.OsVersion
    LogicalDiskCount = $DiskInfo.count
    FreeSpace_GB     = [System.Math]::Round(($FreeSpace.Free / 1gb), $DriveSpaceRounding)
    CPUCore          = $CPUCore.NumberOfCores
    TotalMemory      = $MemorySum / 1gb
}
Write-Output $obj