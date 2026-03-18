# Wazuh Agent Scripts

Intune **run remediation** scripts for **one-time** installation, uninstallation or upgrade of the Wazuh agent on a specific device.

## 🔧 Remediation list

- **Install Wazuh Agent**: [install-wazuh-agent-detection.ps1](install-wazuh-agent-detection.ps1)
- **Uninstall Wazuh Agent**: [uninstall-wazuh-agent-detection.ps1](uninstall-wazuh-agent-detection.ps1)
- **Upgrade Wazuh Agent**: [upgrade-wazuh-agent-detection.ps1](upgrade-wazuh-agent-detection.ps1)

## ⚙️ Configuration

Enter the details of **your Wazuh instance** and the latest version of the agent in the **CONFIGURATION** section.

```pwsh
# ==============================================================
# CONFIGURATION – edit before deployment
# ==============================================================

$WazuhVersion = "4.14.4-1" 
$ManagerIP = "YourWazuhManagerIP"
$RegistrationPassword = "YourPassword"
$AgentGroup = "default"
```

## 📦 Remediation details

| Field | Description |
| ----- | ----------- |
| **Name** | Wazuh - ``Install`` / ``Uninstall`` / ``Upgrade`` agent |
| **Description** | This remediation ``installs`` / ``uninstalls`` / ``upgrades`` Wazuh agent on a specific device. <br> Designed for use with the 'Run remediation' feature. |
| **Detection script file** | ``install`` / ``uninstall`` / ``upgrade`` -wazuh-agent-detection.ps1 |
| **Remediation script file** | Empty |
| **Run this script using the logged-on credentials** | No |
| **Enforce script signature check** | No |
| **Run script in 64-bit PowerShell** | Yes |
