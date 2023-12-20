function Add-Two {
    param (
        [int]$Number
    )

    Write-Output (($Number * 2) + 5)
}