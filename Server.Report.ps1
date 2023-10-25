# gets computer name
$Info = Get-ComputerInfo | Select-Object CsDNSHostName
$Info