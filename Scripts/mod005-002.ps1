Get-WmiObject -Class win32_computersystem -ComputerName dc #network communication done over RPC (TCP135, dynamic port range)
Get-CimInstance -ClassName win32_computersystem -ComputerName dc #network communication done over WinRM (TCP80, TCP443)


Get-WmiObject -Class win32_diskdrive -ComputerName dc -Credential (Get-Credential)

New-CimSession -ComputerName dc -Credential (Get-Credential) -Name dcdisks
Get-CimInstance -ClassName Win32_DiskDrive -CimSession (Get-CimSession -Name dcdisks)


$cimsession = New-CimSession -ComputerName dc -Credential (Get-Credential)
Get-CimInstance -ClassName Win32_DiskDrive -CimSession $cimsession

Invoke-CimMethod -ComputerName dc -ClassName Win32_Process -MethodName Create -Arguments @{CommandLine='notepad.exe';CurrentDirectory='C:\'}
Invoke-CimMethod -CimSession $cimsession -ClassName win32_process -MethodName create -Arguments @{commandline='notepad.exe'}