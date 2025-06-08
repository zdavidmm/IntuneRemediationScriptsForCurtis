Write-Host "Checking for Windows updates..."
try {
    UsoClient.exe StartScan | Out-Null
    UsoClient.exe StartDownload | Out-Null
    UsoClient.exe StartInstall | Out-Null
    Write-Host "Windows Update initiated"
} catch {
    Write-Error "Failed to start Windows Update: $_"
    exit 1
}
