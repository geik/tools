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

## Do some additional Windows stuff that Chocolatey was unable to do
- Install Malwarebytes manually
- Install from the Microsoft Store:
    - wsl-ubuntu-1804
    - wsl-alpine
        `remark: A WSL distro is a userbased setup`
- Add yourself to the docker-users group
    ```bash
    # elevated cmd
    net localgroup docker-users %USERNAME% /add
    ```

------

## Additional
- Take care that your editor does Unix-style line-endings only (LF instead of CRLF)
- Configure Git
    ```bash
    # git bash
    git config --global core.autocrlf false
    git config --global user.email "your@mail.com"
    git config --global user.name "Your Name"
    ```
- Use your Windows Homedir as home for git-bash
    ```bash
    # elevated cmd
    setx HOME %USERPROFILE%
    ```
- User your Windows Homedir as home within Ubuntu-WSL
    ```bash
    # WSL - Ubuntu-18.04
    sudo nano /etc/passwd
    ```
    Change the last line:  
    ```txt
    my-ubuntu-user:x:1000:1000:,,,:/home/my-ubuntu-user:/bin/bash
    ```  
    To:  
    ```txt
    my-ubuntu-user:x:1000:1000:,,,:/mnt/c/users/my-windows-user:/bin/bash
    ```  
- Generate SSH key
    ```bash
    # WSL - Ubuntu-18.04
    ssh-keygen -t rsa -b 4096 -C "your_email@domain.com"
    ```
- Set a lock password on your screensaver
    ```bash
    # elevated powershell
    Set-ExecutionPolicy Unrestricted
    ./screensaver.ps1
    ```
    Active after re-logon. 
- Enable `Developer Mode`
    ```bash
    # elevated cmd
     reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"
    ```


## Install all Ubuntu packages in WSL - Ubuntu-18.04
Remark: A WSL distro is a userbased setup, so installing software onto it is also (windows) userbased.
```bash
# WSL - Ubuntu-18.04
cd wsl && sudo ./install.sh
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


<br/>
<br/>
<br/>
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

## The Git one-liner
```bash
# git bash
git add . && git commit -m "added stuff" && git push
```