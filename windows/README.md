# Windows workstation setup

## Prereq - install chocolatey & instchoco
- See:  
    https://chocolatey.org/install  
- And:  
    https://chocolatey.org/packages/InstChoco  
    Or:  
    ```bash
    # elevated cmd
    choco install -y instchoco
    ```

## Enable Windows features for Hyper-V and Containers
From an elevated PowerShell window  
```powershell
# elevated powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
Enable-WindowsOptionalFeature -Online -FeatureName containers –All
```

# Active the Windows Subsystem for Linux
```powershell
# elevated powershell
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux
```

## Activate Windows 10
```bash
# elevated cmd
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms kms8.msguides.com
```

## Install the software
```bash
# elevated cmd
curl https://raw.githubusercontent.com/geik/tools/master/windows/PACKAGES.CONFIG --output packages.config
choco install -my packages.config
```


------

## Additional
- Generate SSH key
    ```bash
    # WSL - Ubuntu-18.04
    ssh-keygen -t rsa -b 4096 -C "your_email@domain.com"
    ```
- Upgrade all packages in WSL - Ubuntu-18.04
    ```bash
    # WSL - Ubuntu-18.04
    apt update && apt upgrade
    ```
- Export all existing software packages to quickly setup another workstation
    ```bash
    # elevated cmd
    instchoco -backupwithversions
    ```

