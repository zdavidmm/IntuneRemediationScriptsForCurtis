Write-Host "Resetting Company Portal..."
try {
    Get-AppxPackage -Name Microsoft.CompanyPortal | Reset-AppxPackage -ErrorAction Stop
    Write-Host "Company Portal reset successfully"
} catch {
    Write-Warning "Reset-AppxPackage failed: $_. Trying re-register"
    Get-AppxPackage -Name Microsoft.CompanyPortal | ForEach-Object {
        Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml" -ErrorAction SilentlyContinue
    }
}
