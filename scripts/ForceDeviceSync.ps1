Write-Host "Triggering device sync with Intune..."
try {
    Restart-Service -Name IntuneManagementExtension -Force -ErrorAction Stop
    Get-ScheduledTask -TaskName PushLaunch -ErrorAction SilentlyContinue | Start-ScheduledTask -ErrorAction SilentlyContinue
    dsregcmd /sync | Out-Null
    Write-Host "Device sync initiated"
} catch {
    Write-Error "Failed to trigger device sync: $_"
    exit 1
}
