#WMI - windows management instrumentation


Get-Command *wmi*
Get-Command *cim*


Get-WmiObject -List -Class *bios*

Get-WmiObject -Class win32_bios
Get-CimInstance -ClassName win32_bios


Get-WmiObject -Class win32_bios | Get-Member
Get-CimInstance -ClassName win32_bios | Get-Member


Get-WmiObject -Query "select * from win32_bios"
Get-CimInstance -Query "select * from win32_bios"


Get-WmiObject -Class win32_logicaldisk
Get-WmiObject -Class win32_logicaldisk -Filter "DeviceID='C:'"
Get-CimInstance -ClassName win32_logicaldisk -Filter "DeviceID='C:'"

Get-WmiObject -Query "select * from win32_logicaldisk where DeviceID='C:'"
Get-CimInstance -Query "select * from win32_logicaldisk where DeviceID='C:'"


Get-WmiObject -Query "select Size,DeviceID,DriveType from win32_logicaldisk where DeviceID='C:'"
Get-CimInstance -Query "select Size,DeviceID,DriveType from win32_logicaldisk where DeviceID='C:'"


Get-CimInstance -ClassName win32_process | gm -MemberType Methods
Get-WmiObject -ClassName win32_process | gm -MemberType Methods

([wmiclass]'win32_process').GetMethodParameters('Terminate')
([wmiclass]'win32_process').GetMethodParameters('Create')


Invoke-WmiMethod -Class win32_process -Name Create -ArgumentList 'cmd.exe','C:\'
Invoke-CimMethod -ClassName win32_process -MethodName Create -Arguments @{CommandLine='cmd.exe';CurrentDirectory='C:\Users'}


Invoke-WmiMethod -Class win32_process -Name Create -ArgumentList 'cmd.exe /c ipconfig & pause','C:\'
Invoke-CimMethod -ClassName win32_process -MethodName Create -Arguments @{CommandLine='cmd.exe /c ipconfig & pause';CurrentDirectory='C:\Users'}


Invoke-CimMethod -ComputerName server1 -ClassName win32_process -MethodName Create -Arguments @{CommandLine='cmd.exe /c hostname > C:\hostname.txt'}
Invoke-CimMethod -ComputerName server1 -ClassName win32_process -MethodName Create -Arguments @{CommandLine='cmd.exe /c mkdir IWasHereUsingCIMMethod';CurrentDirectory='C:\'}
Invoke-Command -ComputerName server1 -ScriptBlock {Get-ChildItem C:\}

$wmicreds = Get-Credential
Invoke-WmiMethod -Computer server1 -Credential $wmicreds -Class win32_process -Name Create -ArgumentList 'cmd.exe /c whoami > C:\whoami.txt','C:\'
Invoke-Command -ComputerName server1 -ScriptBlock {Get-Content C:\whoami.txt}


$cimsession = New-CimSession -ComputerName server1 -Credential $wmicreds
$cimsession
Invoke-CimMethod -CimSession $cimsession -Class win32_process -Name Create -Arguments @{CommandLine='cmd.exe /c whoami > C:\whoami_cim.txt';CurrentDirectory='C:\'}
Invoke-Command -ComputerName server1 -ScriptBlock {Get-Content C:\whoami_cim.txt}


#install app using the following command
#setup.exe /arg1 value1 /silent /noreboot
Invoke-Command -ComputerName serverX -ScriptBlock {
    C:\Install\setup.exe /arg1 value1 /silent /noreboot
}

Invoke-Command -ComputerName serverX -ScriptBlock {
    Set-Location C:\Install
    setup.exe /arg1 value1 /silent /noreboot
}

Invoke-Command -ComputerName serverX -ScriptBlock {
    Set-Location C:\Install
    & setup.exe /arg1 value1 /silent /noreboot
}

Invoke-CimMethod -ComputerName server1 `
    -ClassName win32_process `
    -MethodName Create `
    -Arguments @{CommandLine='setup.exe /arg1 value1 /silent /noreboot';CurrentDirectory='C:\Install'}


Invoke-CimMethod -ComputerName server1 `
    -ClassName win32_process `
    -MethodName Create `
    -Arguments @{CommandLine='setup.exe /arg1 value1 /silent /noreboot';CurrentDirectory='C:\Install'}


Invoke-Command -Authentication Credssp -Credential $creds -ComputerName serverX -ScriptBlock {
    Set-Location C:\Install
    & setup.exe /arg1 value1 /silent /noreboot
}

Invoke-Command -Authentication Credssp -Credential $creds -ComputerName serverX -ScriptBlock {
    Invoke-CimMethod -ClassName win32_process `
        -MethodName Create `
        -Arguments @{CommandLine='setup.exe /arg1 value1 /silent /noreboot';CurrentDirectory='\\serverX2\share1'}
}