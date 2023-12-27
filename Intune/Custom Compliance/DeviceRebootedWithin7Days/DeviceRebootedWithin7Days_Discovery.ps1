# Set the default value to non-compliant
$compliant = $false

# Specify the maximum days allowed since the last full shutdown or reboot
$maximumDays = 7

# Get last full shutdown or reboot event
$lastRestartDate = ((Get-WinEvent -ProviderName 'Microsoft-Windows-Kernel-Boot' | Where-Object { $_.ID -eq 27 -and $_.message -like "*0x0*" } -ea silentlycontinue) | Select-Object -First 1).TimeCreated

# Check if the last full shutdown or reboot event was found
if ($null -ne $lastRestartDate) {
    
    # Calculate the days since the last full shutdown or reboot
    $lastRestartDays = ($(Get-Date) - $lastRestartDate).Days

    # Verify device compliance
    if ($lastRestartDays -lt $maximumDays) {
        $compliant = $true
    }
}

# Prepare JSON output for Intune
$output = @{
    DeviceRebootedWithin7Days = $compliant
}

#Return device compliance status
return $output | ConvertTo-Json -Compress