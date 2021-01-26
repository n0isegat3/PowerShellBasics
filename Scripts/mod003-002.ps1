#file system
Set-Location C:
New-Item C:\temp\test1 -ItemType Directory

#registry
Set-Location HKLM:
Set-Location .\SOFTWARE
New-Item -Name _Training
Set-Location .\_Training
New-ItemProperty -Name Reg1 -Value 1 -Path .


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