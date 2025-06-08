# Intune Remediation Scripts

This repository contains example PowerShell remediation scripts designed for use with Microsoft Intune.
The scripts address common issues faced during Intune deployments.

## Common Intune Issues
- Device sync failures
- Company Portal problems
- Intune Management Extension cache corruption
- Windows updates not installing
- Certificate enrollment errors

## Scripts
| Script | Purpose |
| --- | --- |
| `ForceDeviceSync.ps1` | Trigger a device sync with Intune. |
| `ResetCompanyPortal.ps1` | Reset the Company Portal app. |
| `ClearIMECache.ps1` | Clear the Intune Management Extension cache. |
| `UpdateWindows.ps1` | Initiate Windows Update. |
| `FixCertificateEnrollment.ps1` | Repair certificate enrollment issues. |

Scripts are located in the `scripts` folder.

## Testing
Run the provided bash script to ensure all remediation scripts are present:

```bash
./check_scripts.sh
```

The script lists all detected remediation scripts and returns a non-zero exit code if any are missing or empty.

Pester tests are included to validate the PowerShell scripts. Execute them using PowerShell:

```bash
/tmp/pwsh/pwsh -NoLogo -Command "Invoke-Pester -Path tests"
```

The tests confirm each script is populated and does not contain placeholder text.
