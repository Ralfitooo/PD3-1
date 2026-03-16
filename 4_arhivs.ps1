
$sourceFile = "Errors.txt"
$date = Get-Date -Format "yyyy-MM-dd"
$zipFile = "Atskaite_$date.zip"


Compress-Archive -Path $sourceFile -DestinationPath $zipFile -Force


$fileInfo = Get-Item $zipFile


$sizeInKB = [Math]::Round($fileInfo.Length / 1KB, 2)


Write-Host "Arhivs izveidots: $zipFile"
Write-Host "Arhiva faila izmers: $sizeInKB KB"
