Get-ChildItem -Path C:\Temp

Get-PSProvider
Get-PSDrive

Set-Location env:
Get-ChildItem

Set-Location C:
Get-ChildItem -Path env:

cd HKLM:
gci
cd .\SOFTWARE
cd .\Microsoft\Windows\CurrentVersion\Run
gci
Get-Item HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name SecurityHealth
Get-ItemPropertyValue -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name SecurityHealth #since Pwsh 3.0
Get-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name SecurityHealth | `
    Select-Object -ExpandProperty SecurityHealth #how to do it on pwsh 2.0


New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name CmdLine -Value 'C:\windows\system32\cmd.exe'

New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name pwsh -Value 'C:\windows\system32\cmd.exe'
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name pwsh -Value 'C:\windows\system32\windowspowershell\v1.0\powershell.exe'


Set-Location -Path cert:
gci
cd .\\CurrentUser
gci
cd .\My
gci
Get-ChildItem -Path Cert:\CurrentUser\my -Recurse | Where-Object {$_.Subject -eq 'CN=student'} | ForEach-Object -MemberName Verify

Get-ChildItem -Path Cert:\CurrentUser\my -Recurse | `
    Where-Object {$_.Subject -eq 'CN=student'} | `
    Export-PfxCertificate `
        -Password (ConvertTo-SecureString -String 'P@ssw0rd' -AsPlainText -Force) `
        -FilePath C:\Temp\student.pfx


Get-PSDrive
Set-Location ad:
gci
cd 'DC=cyber-rangers,DC=lab'
gci
cd 'OU=Lab'
gci
gci | Where-Object {$_.objectclass -eq 'user' -and $_.name -eq 'da'} | Select-Object -Property *
New-Item -ItemType user -Name "CN=testuser1" -Path 'AD:\OU=Lab,DC=cyber-rangers,DC=lab'
Set-ItemProperty -Path 'AD:\CN=testuser1,OU=Lab,DC=cyber-rangers,DC=lab' -Name Company -Value 'Cyber Rangers'









Get-PSDrive
New-PSDrive -Name HKU -PSProvider Registry -Root HKEY_USERS
Get-PSDrive
cd HKU:
gci


New-PSDrive -Name profile -PSProvider FileSystem -Root $env:USERPROFILE
gci -Path PROFILE:
Set-Location PROFILE:


New-PSDrive -Name master -PSProvider FileSystem -Root "$env:USERPROFILE\Desktop"
gci -Path master:
Set-Location master:



New-PSDrive -Name netlogon -PSProvider FileSystem -Root \\dc\netlogon
cd netlogon:
gci


New-PSDrive -Name S -PSProvider FileSystem -Root \\dc\SYSVOL -Persist
cd s:
gci