While(1) {
    $group = Read-Host -Prompt "Group"
    $names = Get-ADGroupMember -Identity $group | Select-Object Name -ExpandProperty name | Sort-Object Name
    Write-Output $names
}