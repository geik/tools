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

## Install all Windows software
```bash
# elevated cmd
curl https://raw.githubusercontent.com/geik/tools/master/windows/PACKAGES.CONFIG --output packages.config
choco install -my packages.config
```

## Install all Ubuntu packages in WSL - Ubuntu-18.04
```bash
# WSL - Ubuntu-18.04
cd wsl && ./install.sh
```

## Connect docker & kubectl in WSL to Windows Docker Desktop
See:   
    https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly
- Windows Docker Desktop
  - Check `Expose daemon on tcp://localhost:2375 without TLS`  
- Docker in WSL
    ```bash
    echo "export DOCKER_HOST=tcp://localhost:2375" >> ~/.bashrc && source ~/.bashrc
    ```
- Kubectl in WSL
    ```bash
    mkdir -p ~/.kube
    ln -sf /mnt/c/users/guus/.kube/config ~/.kube/config
    ```

------

## Additional
- Generate SSH key
    ```bash
    # WSL - Ubuntu-18.04
    ssh-keygen -t rsa -b 4096 -C "your_email@domain.com"
    ```

----
## Prepare migration of an existing workstation setup
- Export all existing Windows software packages
    ```bash
    # elevated cmd
    instchoco -backupwithversions
    ```
- Export all existing WSL-Ubuntu software packages
    ```bash
    mkdir mypackages
    apt-clone clone mypackages
    apt-clone info mypackages/*
    ```

