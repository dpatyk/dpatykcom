<#
.SYNOPSIS
    Intune Remediation – Wazuh Agent installation on Windows.

.DESCRIPTION
    Download the Wazuh agent from packages.wazuh.com and install it
    silently, abd then register it with a registration password.

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
$ManagerIP = "YourWazuhManagerIP"
$RegistrationPassword = "YourPassword"
$AgentGroup = "default"

# ==============================================================
# MAIN – script core
# ==============================================================

$TempMsi = "$env:TEMP\wazuh-agent.msi"

try {
    $url = "https://packages.wazuh.com/4.x/windows/wazuh-agent-$WazuhVersion.msi"
    Invoke-WebRequest -Uri $url -OutFile $TempMsi -UseBasicParsing

    $msiArgs = @(
        "/i `"$TempMsi`"",
        "/quiet /norestart",
        "WAZUH_MANAGER=`"$ManagerIP`"",
        "WAZUH_REGISTRATION_SERVER=`"$ManagerIP`"",
        "WAZUH_REGISTRATION_PASSWORD=`"$RegistrationPassword`"",
        "WAZUH_AGENT_GROUP=`"$AgentGroup`""
    )
    $proc = Start-Process msiexec.exe -ArgumentList $msiArgs -Wait -PassThru
    if ($proc.ExitCode -notin @(0, 3010)) { throw "msiexec failed with exit code: $($proc.ExitCode)" }

    Set-Service WazuhSvc -StartupType Automatic
    Start-Service WazuhSvc

    Write-Output "Wazuh agent $WazuhVersion installed successfully."
    exit 0
}
catch {
    Write-Output "Installation failed: $($_.Exception.Message)"
    exit 1
}
finally {
    Remove-Item $TempMsi -Force -ErrorAction SilentlyContinue
}
