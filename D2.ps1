Get-Process | Measure-Object
Get-Process -Name mspaint | Measure-Object

Get-Process | Get-Member -MemberType Properties

Get-Process | Select-Object Id,ProcessName,WS


mspaint


Get-Process -Name mspaint | Select-Object -First 1 | Stop-Process

Get-Process -Name mspaint | ForEach-Object {Write-Host $PSItem}

Get-Process -Name mspaint | ForEach-Object {Write-Host $_}

notepad C:\Temp\testfile.txt
Get-Content C:\Temp\testfile.txt
Get-Content C:\Temp\testfile.txt | Measure-Object
Get-Content C:\Temp\testfile.txt | ForEach-Object {Write-Host  "Content of the line is: $_"}

Get-Content C:\Temp\testfile.txt | ForEach-Object {
    Write-Host 'Processing line started.' -ForegroundColor Yellow
    Write-Host  "Content of the line is: $_"
    Write-Host 'Processing line finished.' -ForegroundColor Green
    }

Get-Content C:\Temp\testfile.txt | ForEach-Object {
    Write-Host 'Processing line started.' -ForegroundColor Yellow
    Write-Host  "Content of the line is: $PSItem"
    Write-Host 'Processing line finished.' -ForegroundColor Green
    }






Get-Process -Name mspaint | Stop-Process

notepad C:\Temp\processes_to_kill.txt
Get-Content C:\Temp\processes_to_kill.txt | Get-Member
Get-Content C:\Temp\processes_to_kill.txt | Stop-Process


Get-Help Stop-Process -Full


Get-Content C:\Temp\processes_to_kill.txt | Stop-Process

Get-Content C:\Temp\processes_to_kill.txt | Get-Process | Stop-Process

Get-Help get-Process -Full


Get-Content C:\Temp\processes_to_kill.txt | Get-Member -MemberType Properties
Get-Content C:\Temp\processes_to_kill.txt | Select-Object @{name='Name';expression={$_}}
Get-Content C:\Temp\processes_to_kill.txt | Select-Object @{name='Name';expression={$_}} | Stop-Process



notepad;calc;mspaint
Get-Process notepad
Get-Process calculator
Get-Process mspaint

notepad C:\Temp\processes_to_kill_byId.txt 
Get-Content C:\Temp\processes_to_kill_byId.txt 
Get-Content C:\Temp\processes_to_kill_byId.txt | Select-Object @{name='Id';expression={$_}}
Get-Content C:\Temp\processes_to_kill_byId.txt | Select-Object @{name='Id';expression={$_}} | Get-Member -MemberType Properties
Get-Content C:\Temp\processes_to_kill_byId.txt | Select-Object @{name='Id';expression={$_}} | Stop-Process



Import-Module ActiveDirectory
Get-ADComputer -Filter *
Get-ADComputer -Filter * | Get-Member -MemberType Properties
Get-ADComputer -Filter * | Invoke-Command -ScriptBlock {$env:COMPUTERNAME}


Get-ADComputer -Filter * | ForEach-Object {
    Invoke-Command -ComputerName $_ -ScriptBlock {$env:COMPUTERNAME}
}

Get-ADComputer -Filter * | ForEach-Object {
    $_ | Select-Object -ExpandProperty DnsHostname
}

Get-ADComputer -Filter * | ForEach-Object {
    $_.DnsHostname
}

Get-ADComputer -Filter * | ForEach-Object {
    Invoke-Command -ComputerName $_.DnsHostname -ScriptBlock {$env:computername}
}

get-help get-service -full

Get-Service -Name Spooler

'spooler' | Get-Service



'this is content of a file' | Out-File -FilePath C:\Temp\fakelog.txt
Get-Content C:\Temp\fakelog.txt
'this is additional content of a file' | Out-File -FilePath C:\Temp\fakelog.txt -Append
Get-Content C:\Temp\fakelog.txt











Get-Volume | Select-Object -Property DriveType, HealthStatus, Size, SizeRemaining
Get-Volume | Select-Object -Property *

Get-ADUser -Filter * -Properties PhysicalDeliveryOfficeName | Select-Object -Property *

Get-ADUser -Filter * -Properties * | Select-Object -Property *




Get-Process | Select-Object -Property ProcessName,Id,VM -First 5

Get-Process | Sort-Object -Property Id | Select-Object -First 5

Get-Process | Select-Object -Property ProcessName -Unique

Get-Process | Group-Object -Property ProcessName





Get-ChildItem C:\Temp | Get-Member

New-Item -Path C:\Temp\ToEncrypt -ItemType Directory

Get-ChildItem C:\Temp\ToEncrypt

1..100 | ForEach-Object {
    New-Item -ItemType File -Path C:\Temp\ToEncrypt -Name "FileToEncrypt$_"
    'data to file' | Out-File -FilePath "C:\Temp\ToEncrypt\FileToEncrypt$_"
}

Get-ChildItem C:\Temp\ToEncrypt | ForEach-Object {
    $_.FullName
    $_.Encrypt()
}

101..200 | ForEach-Object {
    New-Item -ItemType File -Path C:\Temp\ToEncrypt -Name "FileToEncrypt$_"
    'data to file' | Out-File -FilePath "C:\Temp\ToEncrypt\FileToEncrypt$_"
}

Get-ChildItem C:\Temp\ToEncrypt | ForEach-Object {
    $_.FullName
}
Get-ChildItem C:\Temp\ToEncrypt | ForEach-Object {
    $_.Encrypt()
}
Get-ChildItem C:\Temp\ToEncrypt | ForEach-Object -MemberName Encrypt




Get-Process | Select-Object -First 2 -Property ProcessName,Id,PM,@{name='PM(MB)';expression={$_.PM/1024/1024}}

Get-Process | Select-Object -First 2 -Property ProcessName,Id,PM,@{name='PM(MB)';expression={$_.PM/1MB}}

Get-Process | Select-Object -First 2 -Property ProcessName,Id,PM,@{n='PM(MB)';e={$_.PM/1MB}}

Get-Process | Select-Object -First 2 -Property ProcessName,Id,PM,@{n='PM(MB)';e={$_.PM/1MB}},@{n='nonsense';e={'whoooo'}} | Format-Table


4+5
3-1
4/2
5%2 #modulus
4*4

1kB
1MB
1GB
1TB
1PB


Get-Process | Select-Object -f 5 | Format-List
Get-WmiObject win32_logicaldisk | Format-Table -AutoSize




Get-Service | Select-Object -Property StartType,Name,DisplayName,DependentServices,MachineName | Format-Table -AutoSize -Wrap




Get-Process -Name svchost
Get-Process -Id 4

Get-Process -Name svchost
Get-Process | Where-Object -Property Name -EQ -Value svchost

Get-Process | Where-Object -FilterScript {$_.Name -eq 'svchost'}
Get-Process | Where-Object {$_.Name -eq 'svchost'}
Get-Process | Where {$_.Name -eq 'svchost'}
Get-Process | ? {$_.Name -eq 'svchost'}



5 -gt 5
5 -ge 5

'text1' -eq 'TEXT1'

'text1' -ceq 'TEXT1'

'text1' -like '*ext*'

'text1' -clike '*eXT*'
'text1' -like '*eXT*'


'text1' -eq 'TEXT1'
'text1' -ceq 'TEXT1'
'text1' -ieq 'TEXT1'

'mylib.dll' -match '^m(.{3,5})\.dll$'
'alib.dll' -match '^m(.{3,5})\.dll$'



Get-Process | Where-Object {$_.PM -gt 100MB}



Get-Process | Out-GridView


Get-Process | Out-GridView -PassThru -Title 'Select Process'


'create','delete','show' | Out-GridView -PassThru -Title 'select operation'


Get-Process | Where-Object {$_.PM -gt 100MB} | Select-Object ProcessName,Id,@{n='PM_MB';e={$_.PM/1MB}} | Out-Printer

Get-Process | Where-Object {$_.PM -gt 100MB} | Select-Object ProcessName,Id,@{n='PM_MB';e={$_.PM/1MB}} | Export-Csv -Path C:\Temp\myprocs1.csv -Delimiter "`t"

Import-Csv -Delimiter "`t" -Path C:\Temp\myprocs1.csv | gm

Get-Process | Where-Object {$_.PM -gt 100MB} | Select-Object ProcessName,Id,@{n='PM_MB';e={$_.PM/1MB}} | Export-Csv -Path C:\Temp\myprocs2.csv -Delimiter "`t" -NoTypeInformation

Import-Csv -Delimiter "`t" -Path C:\Temp\myprocs2.csv | gm


Get-Process | Where-Object {$_.PM -gt 100MB} | Select-Object ProcessName,Id,@{n='PM_MB';e={$_.PM/1MB}} | ConvertTo-Html | Out-File -FilePath C:\Temp\myprocs3.html


Get-Process | Where-Object {$_.PM -gt 100MB} | Select-Object ProcessName,Id,@{n='PM_MB';e={$_.PM/1MB}} | ConvertTo-Html | Out-Printer


Get-Process | Where-Object {$_.PM -gt 100MB} | Select-Object ProcessName,Id,@{n='PM_MB';e={$_.PM/1MB}} | ConvertTo-Html