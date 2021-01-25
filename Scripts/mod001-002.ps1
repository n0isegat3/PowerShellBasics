# Verb-Noun

Out-File
Get-Service
Get-Process
Get-EventLog
Get-WinEvent -LogName Application -MaxEvents 10
Get-Volume
Get-Disk
Get-ADUser -Filter *
Set-Service -Name Spooler -StartupType Automatic
Get-Certificate
Get-DnsClientCache
Get-NetRoute
Get-NetIPAddress
New-NetIPAddress -InterfaceAlias Ethernet -IPAddress 10.0.0.1 -PrefixLength 24 -DefaultGateway 10.0.0.254
Set-DnsClientServerAddress -InterfaceAlias Ethernet -ServerAddresses 10.0.0.100,10.0.0.101
Get-Date
Get-FileHash -Path C:\Windows\System32\notepad.exe
Get-Item -Path C:\Windows
Get-ChildItem -Path 'C:\Program Files' -Recurse
Get-NetAdapter
Get-NetAdapterAdvancedProperty
Get-ScheduledTask
Get-StartApps
Get-SmbShare
Get-VpnConnection
Get-WindowsCapability -Online
Get-WindowsUpdateLog