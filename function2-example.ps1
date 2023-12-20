Import-Module C:\git\ShowerSmell\tool.psm1

$range = 450..465

foreach ($r in $range) {
    Add-Two -Number $r
}