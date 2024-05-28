Import-Module ActiveDirectory
# Get CSV file from user and import the file
$file = Read-Host -Prompt "Enter a CSV file"
$accountinfo = Import-Csv $file

# Loop through CSV file and create new user accounts
ForEach ($user in $accountinfo) {
    $fname = $user.firstname
    $lname = $user.lastname
    $uname = $user.username
    $dept = $user.department
    $prov = $user.province
    $passwd = $user.password
    $ou = $user.ou
    # Check if the user account already exists in Active Directory
    if (Get-ADUser -F { SamAccountName -eq $uname }) {
        Write-Warning "User account $uname already exists"
    } 
    # If accounts don't already exist, create accounts from file
    else {
        New-ADUser `
            -Name "$fname $lname" `
            -DisplayName "$fname $lname" `
            -GivenName $fname `
            -Surname $lname `
            -SamAccountName $uname `
            -Path $ou `
            -AccountPassword (ConvertTo-SecureString $passwd -AsPlainText -Force) `
            -Department $dept `
            -State $prov `
            -Enabled $True
        Write-Host "Account created for $fname $lname"
    }
}
# Create the AD Groups
ForEach ($group in $accountinfo) {   
    $groupname = $group.department # AD Group
    if (Get-ADGroup -F 'SamAccountName -eq $groupname -and ObjectClass -eq "group"') {
        Write-Warning "Group $groupname already exists"
    }
    else {   
        New-ADGroup -Name $groupname -GroupCategory Security -GroupScope DomainLocal -Path $ou
        Write-Host "Created group $groupname"
    }
}
# Add users to groups
ForEach ($name in $accountinfo) {
    $adgroup = $name.department
    $id = $name.identity
    $samAccountName = $name.username
    if ($id -eq "LocalAdmins") {
        Add-ADGroupMember "Administrators" $samAccountName
        Write-Host "Added $samAccountName to Administrators"
    }
    else {
        Add-ADGroupMember $adGroup $samAccountName
        Add-ADGroupMember $id $samAccountName
        Write-Host "Added $samAccountName to $adgroup"
        Write-Host "Added $samAccountName to $id"
    }
}