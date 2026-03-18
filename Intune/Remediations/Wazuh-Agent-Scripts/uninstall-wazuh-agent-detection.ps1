<#
.SYNOPSIS
    Intune Remediation – Wazuh Agent uninstall on Windows.

.DESCRIPTION
    Silently uninstall the Wazuh agent and remove any leftover 
    files and Windows services.

.NOTES
    Exit 0 = Success, Exit 1 = Failure
#>

# ==============================================================
# FUNCTIONS – local script functions
# ==============================================================

function Get-WazuhUninstallEntry {
    <#
    .SYNOPSIS
        Retrieves the Wazuh Agent uninstall registry entry.
    .DESCRIPTION
        Searches 32-bit and 64-bit uninstall registry paths and returns
        the first matching Wazuh Agent entry, or $null if not found.
    .OUTPUTS
        PSCustomObject or $null
    #>

    $regPaths = @(
        'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*',
        'HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'
    )

    foreach ($path in $regPaths) {
        $entry = Get-ItemProperty -Path $path -ErrorAction SilentlyContinue |
        Where-Object { $_.DisplayName -like 'Wazuh Agent*' } |
        Select-Object -First 1

        if ($entry) { return $entry }
    }
    return $null
}

# ==============================================================
# MAIN – script core
# ==============================================================

try {
    $entry = Get-WazuhUninstallEntry

    if (-not $entry) {
        Write-Output "Wazuh Agent not found."
        exit 0
    }

    # Wazuh Agent removal
    Stop-Service -Name 'WazuhSvc' -Force -ErrorAction SilentlyContinue
    $productCode = $entry.PSChildName
    $proc = Start-Process msiexec.exe -ArgumentList "/x `"$productCode`" /quiet /norestart" -Wait -PassThru
    if ($proc.ExitCode -notin @(0, 3010)) { throw "msiexec uninstall failed with exit code: $($proc.ExitCode)" }

    # Services clean-up
    if (Get-Service -Name 'WazuhSvc' -ErrorAction SilentlyContinue) {
        sc.exe delete WazuhSvc | Out-Null
        Write-Output "Removed leftover service: WazuhSvc"
    }

    # Files clean-up
    $leftovers = @(
        "${env:ProgramFiles(x86)}\ossec-agent",  # 32-bit path
        "$env:ProgramFiles\ossec-agent"          # 64-bit fallback
    )
    foreach ($path in $leftovers) {
        if (Test-Path $path) {
            Remove-Item $path -Recurse -Force -ErrorAction SilentlyContinue
        }
    }

    Write-Output "Wazuh agent uninstalled successfully."
    exit 0
}
catch {
    Write-Output "Uninstall failed: $($_.Exception.Message)"
    exit 1
}
