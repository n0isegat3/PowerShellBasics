Get-Help -Name Out-File -Parameter InputObject
Get-Help -Name Get-Process -Parameter Name
Get-Help -Name Get-Service -Parameter Name

#byvalue
Get-Service -Name 'spooler'
'spooler' | Get-Service

#bypropertyname
Get-Process -Name 'spoolsv' | Stop-Process
Get-Volume -DriveLetter 'C' | Optimize-Volume -Analyze

#parenthetical
'notepad' | Out-File 'C:\Temp\mod002-t1.txt'
Get-Process -Name (Get-Content 'C:\temp\mod002-t1.txt')

Add-ADGroupMember -Identity 'Czech Users' -Members (Get-ADUser -Filter {City -eq 'Prague'})

#calculated property
Get-Process | Select-Object -Property Name,@{n='ComputerName';e={$env:COMPUTERNAME}}
Get-Process | Select-Object -Property Name,@{n='Virtual Memory [MB]';e={$_.virtualmemorysize/1MB}}