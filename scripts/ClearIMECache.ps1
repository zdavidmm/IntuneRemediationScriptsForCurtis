Write-Host "Clearing Intune Management Extension cache..."
$service = 'IntuneManagementExtension'
try { Stop-Service -Name $service -Force -ErrorAction Stop } catch {}
$paths = @(
    "$env:ProgramData\Microsoft\IntuneManagementExtension\Logs",
    "$env:ProgramData\Microsoft\IntuneManagementExtension\Policies",
    "$env:ProgramData\Microsoft\IntuneManagementExtension\SidecarPolicy",
    "$env:ProgramData\Microsoft\IntuneManagementExtension\Plugins"
)
foreach ($path in $paths) {
    if (Test-Path $path) { Remove-Item -Path $path -Recurse -Force -ErrorAction SilentlyContinue }
}
Start-Service -Name $service -ErrorAction SilentlyContinue
