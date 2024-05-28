# Get username via script argument and get the groups the user is in
$username = $args[0]
$associatedGroups = Get-ADPrincipalGroupMembership $username | Select-Object Name -ExpandProperty Name

# Get a list of users in each group
ForEach ($group in $associatedGroups) {
    $member = Get-ADGroupMember -Identity $group | Select-Object Name -ExpandProperty Name | Sort-Object Name
    
    Write-Output "The users in group ""$group"" are:"
    Write-Output $member
    Write-Output ""
}