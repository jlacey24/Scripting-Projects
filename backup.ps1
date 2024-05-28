# Get file name using script argument
$file = $args[0]

# Copy selected file and add ".backup" to the end
Copy-Item $file -Destination "$file.backup"