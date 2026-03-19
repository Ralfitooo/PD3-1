
$upgradeList = winget upgrade | Select-Object -Skip 2



$appsToUpdate = $upgradeList | Where-Object { $_ -match '\s+\d+\.' }
$x = ($appsToUpdate | Measure-Object).Count


if ($x -gt 0) {
    Write-Host "Pieejamie atjauninajumi:" -ForegroundColor Cyan
    $appsToUpdate
    Write-Host "`nSistema ir $x programmas, kuras nepieciesams atjauninat." -ForegroundColor Yellow
} else {
    Write-Host "Visas programmas ir atjauninatas!" -ForegroundColor Green
}

