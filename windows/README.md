# Windows workstation setup

## Prereq - install chocolatey & instchoco
See:
https://chocolatey.org/install  
And:
https://chocolatey.org/packages/InstChoco  
Or:  
From an elevated shell
```cmd
choco install -y instchoco
```

## Export an existing workstation's setup
From an elevated shell
```cmd
instchoco -backupwithversions
```
## Install on a new workstation
From an elevated shell
```cmd
curl https://raw.githubusercontent.com/geik/tools/master/windows/PACKAGES.CONFIG --output packages.config
choco install -my packages.config
```

## Activate Windows
From an elevated shell  
```cmd
slmgr /ipk W269N-WFGWX-YVC9B-4J6C9-T83GX
slmgr /skms kms8.msguides.com
```
