# Insert new Admin password here
$adminPassword = 'Insert your password here'

# Get Admin account details
$adminAccount = Get-LocalUser | ? { $_.SID -Like "S-1-5-21-*-500" }

# Enable Admin account
if (-not($adminAccount.Enabled)) {
    Write-Host "Admin account is disabled. Enabling the Admin account."
    $adminAccount | Enable-LocalUser
}

# Change Local Admin password
Write-Host "Reseting the Admin account password."
$adminPassword = ConvertTo-SecureString -String $adminPassword -AsPlainText -Force
$adminAccount | Set-LocalUser -Password $adminPassword

# Return Admin Account details
Write-Host "System is ready to hack :)"
Write-Host "Admin account name: $($adminAccount.Name)"