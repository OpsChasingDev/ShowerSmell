# get computer name
$Info = Get-ComputerInfo | Select-Object CsDNSHostName, OsVersion
$Info