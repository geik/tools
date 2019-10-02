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
Download the packages file
https://raw.githubusercontent.com/geik/tools/master/windows/PACKAGES.CONFIG  

From an elevated shell
```cmd
choco install -my PACKAGES.CONFIG
```

## Install multiple version
```cmd
choco install -my dotnetcore-sdk --version 2.2.402
```

## Check
googlechrome (nog even met het handje)
jdk11
