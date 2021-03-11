#cert
Get-ChildItem -Path Cert:\LocalMachine\my | Select-Object -Property Subject,Thumbprint,DnsNameList,NotBefore,NotAfter

#file system
Set-Location C:
New-Item C:\temp\test1 -ItemType Directory

Get-Item -Path C:\Windows\system32\notepad.exe | Select-Object -Property Name,FullName,VersionInfo
Get-Item -Path C:\Windows\system32\notepad.exe | Select-Object -ExpandProperty VersionInfo | Select-Object -expand FileVersion

Get-ItemProperty -Path C:\Windows\system32\notepad.exe -Name VersionInfo | Select-Object -ExpandProperty VersionInfo
Get-ItemPropertyValue -Path C:\Windows\system32\notepad.exe -Name VersionInfo | Select-Object -ExpandProperty FileVersion

#registry
Set-Location HKLM:
Set-Location .\SOFTWARE
New-Item -Name _Training
Set-Location .\_Training
New-ItemProperty -Name Reg1 -Value 1 -Path .

New-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name SpustPowerShell -Value 'powershell.exe'
Set-ItemProperty -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name SpustPowerShell -Value 'powershell.exe -version 2.0'

Get-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{FB5F92BF-39E2-4757-A744-55D2D28E9BEF}'
Get-Item -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{FB5F92BF-39E2-4757-A744-55D2D28E9BEF}' | Select-Object -Property Property
Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{FB5F92BF-39E2-4757-A744-55D2D28E9BEF}' -Name DisplayName

Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{FB5F92BF-39E2-4757-A744-55D2D28E9BEF}' -Name DisplayName | `
    Select-Object -ExpandProperty DisplayName
Get-ItemPropertyValue -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\{FB5F92BF-39E2-4757-A744-55D2D28E9BEF}' -Name DisplayName


#AD
Get-PSDrive
Import-Module ActiveDirectory
Get-PSDrive
Set-Location AD:
Get-ChildItem
Set-Location 'DC=cyber-rangers,DC=lab'
Get-ChildItem
Set-Location 'OU=Lab'
Get-ChildItem | Where-Object {$_.objectclass -eq 'user'} | Select-Object -First 1 -Property *
Set-Location ..
New-Item -ItemType user -Path "OU=Lab" -Name "CN=testuser1"
Set-ItemProperty -Path AD:\"CN=testuser1,OU=Lab,DC=cyber-rangers,DC=lab" -Name Company -Value 'Cyber Rangers'

#AD operations using native cmdlets
New-ADUser -Name testuser4 -Path "OU=Lab,DC=cyber-rangers,DC=lab"
Set-ADAccountPassword -Identity testuser4 -NewPassword (ConvertTo-SecureString -String 'P@ssw0rd' -AsPlainText -Force)
Set-ADUser -Identity testuser4 -Enabled $true