Install-Module sqlserver

Set-ExecutionPolicy unrestricted

Import-Module Sqlserver

Get-Command -Module SqlServer | Measure-Object

Get-Command -Module SqlServer

Get-PSDrive

cd SQLSERVER: #local
cd SQLSERVER:\SQL\SERVER2 #remote connection to SERVER2
New-PSDrive -Name SERVER2SQL -PSProvider Sqlserver -Root 'SQLSERVER:\SQL\SERVER2\DEFAULT' #create your own drive
cd SERVER2SQL:
cd DATABASES
cd CyberData
cd TABLES
gci | % {$_.script()}
cd SERVER2SQL:\
Invoke-Sqlcmd -Database cyberdata -Query "select * from hackerslevels"
get-content "C:\query_hackerslevels.sql"
Invoke-Sqlcmd -InputFile "C:\query_hackerslevels.sql"

cd C:
Invoke-Sqlcmd -ServerInstance server2 -Database cyberdata -Query "select * from hackerslevels"

cd SERVER2SQL:\logins\
gci
gci | get-member -MemberType Methods
$login = gci | ? {$_.name -eq 'rangers\domain admins'}
$login
$login.Enable()
cd SERVER2SQL:\databases
$db = gci | Where-Object {$_.name -eq 'cyberdata'}
$db
$db.AutoClose = 0
$db.Alter()