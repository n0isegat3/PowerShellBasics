[string]$StringVariable = 'Text1'
[int]$IntVariable = 1
[bool]$BoolVariable = $true
[string]$NumberVariable = 1


$StringVariable.GetType()
$IntVariable.GetType()
$BoolVariable.Gettype()
$NumberVariable.GetType()


[datetime]$DateTimeVariable = Get-Date
$DateTimeVariable.GetType()

[datetime]$DateTimeVariable2000 = '1/1/2000'
$DateTimeVariable2000.GetType()

$OneProcessVariable = Get-Process -Name mmc
$OneProcessVariable.GetType()

$ArrayVariable = 'a','b','c'
$ArrayVariable.GetType()

$ArrayVariableDefined = @()
$ArrayVariableDefined.GetType()

$ArrayVariableDefined = $ArrayVariableDefined + 'a'
$ArrayVariableDefined = $ArrayVariableDefined + 'b'
$ArrayVariableDefined += 'c'

$ArrayList = New-Object -type System.Collections.ArrayList
$ArrayList.GetType()

$ArrayList.Add('a') | Out-Null
$ArrayList.Add('b')
$ArrayList.Add('c')