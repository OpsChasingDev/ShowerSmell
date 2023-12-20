$range = 1..10
$range2 = 100..105

function Add-Two {
    param (
        [int]$Number
    )

    Write-Output (($Number * 2) + 5)
}

foreach ($r in $range) {
    Add-Two -Number $r
}

foreach ($r2 in $range2) {
    Add-Two -Number $r2
}