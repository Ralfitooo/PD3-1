
$filePath = "$HOME\Documents\Errors.txt"

$startDate = (Get-Date).AddDays(-7)
$errors = Get-WinEvent -FilterHashtable @{LogName='System'; Level=2; StartTime=$startDate} -ErrorAction SilentlyContinue


if ($errors.Count -gt 10) {
    $header = "[KRITISKI] Sistema ir nestabila!"
} else {
    $header = "[OK] Kludu limenis normals."
}


$content = @($header)
foreach ($err in $errors) {
    $content += "$($err.TimeCreated) - $($err.Message)"
}


$content | Out-File -FilePath $filePath -Encoding utf8

Write-Host "Atskaite izveidota: $filePath"
