# Get the filename via script argument and get usernames from file
$file = $args[0]
$names = Get-Content $file

# Ask user to set the default password for the new user accounts
$passwd = Read-Host "Select Default Password for Users" -AsSecureString

# Loop through the usernames to create accounts
foreach ($username in $names) {

    # Create local user accounts, set the default password and add to local "Users" group
    New-LocalUser -Name "$username" -Password $passwd
    Add-LocalGroupMember -Group "Users" -Member $username
}