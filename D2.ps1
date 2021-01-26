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