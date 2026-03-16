
$defender = Get-MpComputerStatus


$realTimeOn = $defender.RealTimeProtectionEnabled
$lastScanAge = $defender.QuickScanAge


if ($realTimeOn -eq $false -or $lastScanAge -gt 3 -or $null -eq $lastScanAge) {
    Write-Host "Sistema ir apdraudeta!" -ForegroundColor Red
}
else {
    Write-Host "Sistema ir drosa." -ForegroundColor Green
}
