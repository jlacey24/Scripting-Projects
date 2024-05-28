# Connect to the ESXi server
Connect-VIServer -Server 127.0.0.1 -Protocol https -User root -Password P@ssword -Force

# Create the menu for PowerCLI options
function menu {
    "Infrastructure As Code  `n"
    #""
    "1 - Upload the Ubuntu ISO"
    "2 - Create a New VM"
    "3 - Take a Snapshot"
    "4 - Create a Template"
    "5 - Create VM's From Template"
    "q - Exit `n"
    #""

    # prompts user to select menu option
    $selection = Read-Host "Enter Selection"
    "`n"

    Switch ($selection) {
        1 { upload }
        2 { new_vm }
        3 { new_snapshot }
        4 { new_template }
        5 { vm_from_template }
        q { exit }
    }
}

# Copy ubuntu iso from the desktop and upload to the datastore
function upload {
    $datastore = Get-Datastore datastore1
    New-PSDrive -Name ds1 -PSProvider VimDatastore -Root '\' -location $datastore
    Copy-DatastoreItem C:\Users\<username>\Desktop\ubuntu-20.04.2.0-desktop-amd64.iso -Destination ds1:\ubuntu.iso

    menu
}

# Create new VM, add the ubuntu iso to the drive, start the VM
function new_vm {
    $myVM = New-VM -Name lacey_vm1 -Datastore Datastore1 -DiskGB 20 -DiskStorageFormat Thin `
        -MemoryGB 4 -NumCpu 2 -CD -GuestId ubuntu64guest
    New-CDDrive -VM $myVM -IsoPath '[datastore1] \ubuntu.iso' -StartConnected
    Start-VM $myVM

    menu
}

# Take a snapshot of the new vm
function new_snapshot {
    New-Snapshot -VM lacey_vm1 -Name Snap1
    
    menu
}

# Create template from new vm
function new_template {
    
    New-Template -VM lacey_vm1 -Name "lacey_vm1_template" -Datastore datastore1 -Location 127.0.0.1

    menu
}

# Create 2 new vm's from template
function vm_from_template {
    
    ForEach ($i in 1..2) {
        New-VM -Template lacey_vm1_template -Name "UbuntuVM$i" -VMHost 127.0.0.1
        Start-VM -VM "UbuntuVM$i"
    } 

    menu
}

# Call the menu until user exits
menu