#WMI = Windows Management Instrumentation
# file on disk ~ "database"
# classes ~ "tables"
# namespace ~ "group of tables" or "parallel dimension"
# can be used to gather data from the system (query) or modify system (method)
# 'Common Information Model' structure

#wmi explorer v2
#wmi explorer


Get-Command -Noun *CIM* #CIM cmdlets (WinRM for remote connection)
Get-Command -Noun *WMI* #WMI cmdlets (RPC for remote connection

#WMI -> namespace -> class -> instance (row/record) -> properties/attributes (columns)
#default namespace root\cimv2
Get-WmiObject -Namespace Root -Class __NAMESPACE | select -ExpandProperty Name
Get-WmiObject -Namespace root\Microsoft -Class __NAMESPACE | select -ExpandProperty Name
Get-WmiObject -Namespace root\Microsoft\Windows -Class __NAMESPACE | select -ExpandProperty Name

Get-CimInstance -Namespace root -ClassName __NAMESPACE | select -ExpandProperty Name
Get-CimInstance -Namespace root\Microsoft -ClassName __NAMESPACE | select -ExpandProperty Name
Get-CimInstance -Namespace root\Microsoft\Windows -ClassName __NAMESPACE | select -ExpandProperty Name

Get-WmiObject -List -Class win32_bios
Get-CimClass -ClassName win32_bios

Get-WmiObject -Class win32_bios
Get-CimInstance -ClassName win32_bios

Get-WmiObject -Class win32_bios | gm
Get-CimInstance -ClassName win32_bios | gm

#WMI Query Language (WQL)
#"select * from win32_bios"

Get-WmiObject -Class win32_Bios
Get-WmiObject -Query "select * from win32_bios"
Get-CimInstance -ClassName win32_Bios
Get-CimInstance -Query "select * from win32_bios"

Get-WmiObject -Class win32_Bios -Property Name
Get-WmiObject -Query "select Name from win32_bios"

Get-WmiObject -Class win32_logicaldisk
Get-WmiObject -Query "select * from win32_logicaldisk"

Get-WmiObject -Class win32_logicaldisk -Filter "DeviceID='C:'"
Get-WmiObject -Query "select * from win32_logicaldisk where DeviceID='C:'"
Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DeviceID='C:'"
Get-CimInstance -Query "select * from win32_logicaldisk where DeviceID='C:'"

Get-CimInstance -ClassName Win32_Process
Get-Process

Get-CimInstance -ClassName Win32_Process | Get-Member -MemberType Methods
Get-WmiObject -Class Win32_Process | Get-Member -MemberType Methods

([wmiclass]'win32_process').GetMethodParameters('Create')
([wmiclass]'win32_process').GetMethodParameters('Terminate')

Invoke-WmiMethod -Class win32_process -Name create -ArgumentList notepad.exe
Invoke-CimMethod -ClassName win32_process -MethodName create -Arguments @{commandline='notepad.exe'}

Invoke-CimMethod -ClassName win32_process -MethodName create -Arguments @{commandline='C:\Program Files\Internet Explorer\iexplore.exe';currentdirectory='C:\Program Files\Internet Explorer'}

Invoke-CimMethod -ClassName Win32_Process -MethodName Create -Arguments @{CommandLine='powershell.exe';CurrentDirectory='C:\Temp'}
([wmiclass]'win32_process').Create('powershell.exe','C:\temp')