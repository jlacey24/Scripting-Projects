# Get number of days via script argument
# Create variable with the current date (zip file name)
# Get current directory location
$numDays = $args[0]
$zipName = Get-Date -Format "MM-dd-yy"
$currentdir = Get-Location

# Get files last modified past number of days specified by the user
$filesToZip = Get-ChildItem | Where-Object {$_.LastWriteTime -lt (Get-Date).AddDays(-$numDays)}

# Check to see if files are available to archive
if (!($null -eq $filesToZip)) {
    Compress-Archive $filesToZip -Update -DestinationPath $currentdir\$zipName
}
else {
    Write-Host "No files to archive"
}