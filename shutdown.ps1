# A script for shutting down the computer while music plays
# Params: -s (seconds) -m (minutes) -h (hours)
# Author: Thomas Megantz

param (
    [int]$s = 0,
    [int]$m = 0,
    [int]$h = 0
)

$total = 0

If ($s -gt 0) {
    Write-Host "Seconds: $s"
    $total = $total + $s
}
If ($m -gt 0) {
    Write-Host "Minutes: $m"
    $total = $total + 60 * $m
}
If ($h -gt 0) {
    Write-Host "Hours: $h"
    $total = $total + 3600 * $h
}

Write-Host "Total time: $total seconds"
If ($total -eq 0) {
    Write-Host @"
Time must be greater than 0, dumbass.
Just shut your own shit down.
"@
    Exit
}

while ($total -ge 0) {
    Write-Host $total
    Start-Sleep -s 1
    $total--
}

Write-Host "Shutting down..."
Stop-Computer
