# Notes

PS C:\> mkdir agent ; cd agent
PS C:\agent> Add-Type -AssemblyName System.IO.Compression.FileSystem ; [System.IO.Compression.ZipFile]::ExtractToDirectory("$HOME\Downloads\vsts-agent-win-x64-2.211.1.zip", "$PWD")

PS C:\agent> .\config.cmd

PS C:\agent> .\run.cmd

j4si3x35csxp6t33qfe2pvl76lz5o3utufytcx2hnzjy4h5mocya