# Get the PID and (optional) sleep time via script argument 
# Use Get-Process to retrieve the Process ID and ProcessName
$processID = $args[0]
$sleepTime = $args[1]
$findProcess = Get-Process -PID $processID
$processName = (Get-Process -PID $processID).ProcessName

while (1) {

    # If user does not supply sleep time, set default of 10 seconds
    if ($null -eq $sleepTime) {
        sleep 10
    }
    else {
        sleep $sleepTime
    }

    # Check to see if the process is running
    if (!($findProcess).Responding) {
        Write-Host "Process Name: $processName"
        Write-Host "Process ID $processID is not running"
        Write-Host ""
    }
    else {
        Write-Host "Process Name: $processName"
        Write-Host "Process ID $processID is running"
        Write-Host ""
    }
}