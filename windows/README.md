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
instchoco -y -s https://raw.githubusercontent.com/geik/tools/master/windows/PACKAGES.CONFIG
```
