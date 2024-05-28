# Get the extension as a script argument
$ext = $args[0]

# Search in the current directory for the extension supplied by the user
$filesToBackup = Get-ChildItem -Filter *.$ext

# Create file path for backup folder
$currentdir = Get-Location
$newfolder = "backup"
$newpath = "$currentdir\" + $newfolder

# Check if backup folder has already been created and create it if necessary
if (!(Test-Path $newpath)) {
    New-Item -ItemType Directory -Path $currentdir -Name $newfolder
}
else {
    Write-Host ""
    Write-Host "The folder ""$newfolder"" already exists"
    Write-Host ""
} 

# Copy the files and move them to the backup folder
Copy-Item $filesToBackup -Destination $newpath
foreach ($file in $filesToBackup) {
    Write-Host "Backed up $file"
}