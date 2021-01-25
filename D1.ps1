Get-Service | Select-Object *

Get-Process

Get-EventLog -LogName Security -After (Get-Date).AddHours(-5)

Get-WinEvent -ListLog *

Get-WinEvent -FilterHashtable @{}

Get-Disk
Get-PhysicalDisk
Get-Volume
Get-Partition

Get-NetAdapter
Get-NetAdapterAdvancedProperty

Get-NetIPAddress
New-NetIPAddress -IPAddress 10.10.10.10 -PrefixLength 24 -DefaultGateway 10.10.10.1 -InterfaceAlias 'Ethernet 2'

ipconfig /all
Get-NetIPConfiguration
gip

Get-DnsClientServerAddress
Set-DnsClientServerAddress -InterfaceAlias 'Ethernet 2' -ServerAddresses '10.10.10.2','10.10.10.3'

ipconfig /displaydns
Get-DnsClientCache

Get-NetRoute

Get-Date -Format 'yyyy-MM-dd---hh:mm:ss'
Get-Date -Format 'yyyy-MM-dd---HH:mm:ss'
Get-Date -Format 'yyyy-MM-dd---HH:mm:ss:fff'

Get-ChildItem -Path C:\
Get-ChildItem -Path C:\ -File
Get-ChildItem -Path C:\ -Directory
Get-ChildItem -Path C:\Windows\Temp -Recurse
Get-ChildItem -Path C:\Windows\Temp -Recurse -Include mpcmdrun.log
Get-ChildItem -Path C:\Windows\Temp -Recurse -Include *.log
Get-ChildItem -Path C:\Windows\Temp -Recurse -Include *.log -Exclude *debug*

Get-ChildItem -Path HKLM:\SOFTWARE

Get-Item -Path C:\windows\notepad.exe | Select-Object *


mkdir 'C:\Temp'
New-Item -Path 'C:\Temp' -ItemType Directory

Copy-Item -Path C:\Windows\notepad.exe -Destination C:\Temp

Get-FileHash -Path C:\Windows\notepad.exe -Algorithm MD5

Get-FileHash -Path C:\Windows\notepad.exe
Get-FileHash -Path C:\Temp\notepad.exe

(Get-FileHash -Path C:\Windows\notepad.exe).Hash -eq (Get-FileHash -Path C:\Temp\notepad.exe).Hash
(Get-FileHash -Path C:\Windows\notepad.exe | select-object -expandproperty Hash) -eq (Get-FileHash -Path C:\Temp\notepad.exe | Select-Object -expandproperty Hash)


schtasks.exe
Get-ScheduledTask

Get-StartApps
Get-Command *start*
Import-StartLayout

Get-WindowsUpdateLog


Get-Volume
Stop-Process

Get-Help Get-Volume -Full
Get-Help Stop-Process -Full


Get-Service -Name Spooler
Get-Service spooler
Get-Help Get-Service -Full

Get-Command -Verb get -Noun command
Get-Command -Noun command -Verb get





Get-Service spooler
Get-Service -Name spooler #this is the only one right approach for a script
Get-Service -Nam spooler
Get-Service -Na spooler
Get-Service -N spooler




Get-ChildItem
dir

Get-Process
gps

Get-Service
gsv
service #this is weird :)







$PROFILE


Console/Specific User:
C:\Users\student\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

ISE/Specific User:
C:\Users\student\Documents\WindowsPowerShell\Microsoft.PowerShellISE_profile.ps1

Any host(application)/Specific User:
C:\Users\student\Documents\WindowsPowerShell\profile.ps1


$PSHOME

Console/All Users:
C:\Windows\System32\WindowsPowerShell\v1.0\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1

ISE/All Users:
C:\Windows\System32\WindowsPowerShell\v1.0\Documents\WindowsPowerShell\Microsoft.PowerShellISE_profile.ps1

Any host(application)/All Users:
C:\Windows\System32\WindowsPowerShell\v1.0\Documents\WindowsPowerShell\profile.ps1





New-Item -Path C:\Temp -Name 'Folder with spaces in the name 1' -ItemType Directory
New-Item -Path C:\Temp -Name "Folder with spaces in the name 2" -ItemType Directory

$VARIABLE1 = 'VALUE1'
Write-Host 'Variable name is VARIABLE1'
Write-Host 'Variable1 value is $VARIABLE1'
Write-Host "Variable1 value is $VARIABLE1"

Write-Host 'Current datetime is Get-Date'
Write-Host "Current datetime is Get-Date"
Write-Host "Current datetime is (Get-Date)"
Write-Host "Current datetime is $(Get-Date)"


'Variable name is {0}' -f $VARIABLE1
'Current datetime is {0}' -f (Get-Date)


$price = 100

Write-Host "The price is `$$price"

Write-Host "datetime is $(get-date)"


New-ADUser -Name jan `
    -displayname jan `
    -surname jan `
    -givenname jan `
    -samaccountname jan



Write-Host "This is first line and this is second line"

Write-Host "This is first line"
Write-Host "and this is second line"

Write-Host "This is first line `nand this is second line"


Write-Host "Detailed info below:"
Write-Host "- Computer: $($env:computername)"
Write-Host "- User: $($env:username)"




Write-Host "Detailed info below:"
Write-Host "`t- Computer: $($env:computername)"
Write-Host "`t- User: $($env:username)"



# this is one line comment

<#
this is
comment
block
#>

if ($some -eq 1) {
    DoIt
} else {
    DoAnother
}


#region
DoThis
DoThat
DoAnother
#endregion

#region
ContinueHere
ContinueThere
#endregion



#region main code
DoThis
DoThat
DoAnother
#endregion main code

#region final code
ContinueHere
ContinueThere
#endregion final code

#hit CTRL+M to collapse regions