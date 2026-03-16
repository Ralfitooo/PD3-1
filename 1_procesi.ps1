$topProcesses = Get-Process | 
    Where-Object { $_.Name -ne "svchost" } | 
    Sort-Object WorkingSet64 -Descending | 
    Select-Object -First 5
Write-Host "Top 5 procesi pec RAM paterina (bez svchost):" -ForegroundColor Cyan

$topProcesses | Select-Object Name, @{Name="RAM (MB)"; Expression={[Math]::Round($_.WorkingSet64 / 1MB, 2)}} | Format-Table -AutoSize
$totalRamMB = ($topProcesses | Measure-Object -Property WorkingSet64 -Sum).Sum / 1MB
Write-Host ("Kopejais so procesu RAM paterins: " + [Math]::Round($totalRamMB, 2) + " MB") -ForegroundColor Yellow