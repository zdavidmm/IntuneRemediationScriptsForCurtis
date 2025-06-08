Write-Host "Fixing certificate enrollment..."
try {
    certutil -pulse | Out-Null
    gpupdate /force | Out-Null
    Write-Host "Certificate enrollment triggered"
} catch {
    Write-Error "Failed to fix certificate enrollment: $_"
    exit 1
}
