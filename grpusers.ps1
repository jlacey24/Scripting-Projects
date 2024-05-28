# Get group name via script argument and then list users in that group
$group = $args[0]
$names = Get-ADGroupMember -Identity $group | Select-Object Name -ExpandProperty name | Sort-Object Name
Write-Output $names