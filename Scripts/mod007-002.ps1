$object = Get-Process | Select-Object -First 1 -Property Name,Id
$object

$hashtable = @{FirstName='Jan';LastName='Marek'}
$hashtable
$hashtable['LastName']

#splatting

$CIMparams = @{ClassName = 'win32_bios';ComputerName = 'dc'}
Get-CimInstance @CIMparams