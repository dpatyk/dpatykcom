<#
.SYNOPSIS
    Intune Remediation – Wazuh Agent upgrade on Windows.

.DESCRIPTION
    Download the Wazuh agent from packages.wazuh.com and upgrade it
    silently without re-registration, preserving the existing Agent ID.

.LINK
    MSI deployment variables:
    https://documentation.wazuh.com/current/user-manual/deployment-variables/deployment-variables-windows.html

.NOTES
    Exit 0 = Success, Exit 1 = Failure
#>

# ==============================================================
# CONFIGURATION – edit before deployment
# ==============================================================

$WazuhVersion = "4.14.4-1"

# ==============================================================
# MAIN – script core
# ==============================================================

$TempMsi = "$env:TEMP\wazuh-agent.msi"

try {
    $url = "https://packages.wazuh.com/4.x/windows/wazuh-agent-$WazuhVersion.msi"
    Invoke-WebRequest -Uri $url -OutFile $TempMsi -UseBasicParsing

    $msiArgs = @(
        "/i `"$TempMsi`"",
        "/quiet /norestart"
    )
    $proc = Start-Process msiexec.exe -ArgumentList $msiArgs -Wait -PassThru
    if ($proc.ExitCode -notin @(0, 3010)) { throw "msiexec failed with exit code: $($proc.ExitCode)" }

    Set-Service WazuhSvc -StartupType Automatic
    Start-Service WazuhSvc

    Write-Output "Wazuh agent new version: $WazuhVersion"
    exit 0
}
catch {
    Write-Output "Upgrade failed: $($_.Exception.Message)"
    exit 1
}
finally {
    Remove-Item $TempMsi -Force -ErrorAction SilentlyContinue
}
