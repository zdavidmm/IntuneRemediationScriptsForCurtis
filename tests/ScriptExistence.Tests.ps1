Describe 'Intune remediation scripts' {
    $scriptRoot = $PSScriptRoot
    $repoRoot = Split-Path -Path $scriptRoot -Parent
    $scriptDir = Join-Path -Path $repoRoot -ChildPath 'scripts'
    $scriptFiles = Get-ChildItem -Path $scriptDir -Filter '*.ps1'
    $scriptCount = $scriptFiles.Count

    It 'Scripts should exist' -TestCases @{ Count = $scriptCount } {
        param($Count)
        $Count | Should -BeGreaterThan 0
    }

    $testCases = foreach ($f in $scriptFiles) {
        @{ Path = $f.FullName; Name = $f.Name }
    }

    It 'Script <Name> should not be empty' -TestCases $testCases {
        param($Path, $Name)
        (Get-Content $Path).Length | Should -BeGreaterThan 0
    }

    It 'Script <Name> should not contain placeholders' -TestCases $testCases {
        param($Path, $Name)
        -not (Select-String -Path $Path -Pattern 'Placeholder' -SimpleMatch)
    }
}
