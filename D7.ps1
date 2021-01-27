New-Variable -Name Variable1 -Value 123
$Variable1


$Variable2 = 456

$Variable3 = 'text'

$Variable4 = Get-Date

$Variable5 = Get-Content C:\Temp\processes_to_kill.txt

$Variable2.GetType()







$FN = 'Jan'
$LN = 'Marek'
$Result = $FN + $LN






$FN = Read-Host 'Provide First Name'
$LN = Read-Host 'Provide Last Name'
$Result = $FN + $LN



[string]$FN2 = 0
[string]$LN2 = 1
$Result2 = $FN2 + $LN2
$Result2




[int]$Int = 1

[bool]$IsItTrue = 0


[datetime]$Date1 = '1/1/2021'


$Process = Get-Process | Select-Object -First 1
$Process.GetType()


[System.Diagnostics.Process]$proc = Get-Process | Select-Object -Last 1



$Letters = 'a','b','c'
$Letters.GetType()

$Letters | Select-Object -f 1
$Letters[0]
$Letters[-1]

$Letters = $Letters + 'd'
$Letters += 'e'


$Letters2 = 'a'
$Letters2 += 'b'


$Letters3 = @()
$Letters3 += 'a'
$Letters3 += 'b'
$Letters3

$Letters4 = @('a')
$Letters4 += 'b'
$Letters4




<#
array with 1000 items ~ consumes 1GB memory
add 1 item to the existing array => 1001 items ~ for a short time you need at least 2001MB of memory!
#>




$ArrayList = New-Object -TypeName System.Collections.ArrayList
$ArrayList.Add('a')
$ArrayList.Add('b')
$ArrayList.Add('c')
$ArrayList
$ArrayList.Add('x') | Out-Null
$null = $ArrayList.Add('y')






$hashtable1 = @{FistName='Jan';LastName='Marek'}
$hashtable1

$hashtable1 | Select-Object -First 1

$hashtable1['FistName']
$hashtable1['LastName']




#splatting

Get-CimInstance -ClassName win32_bios -ComputerName dc

$parameters = @{ClassName='win32_bios';ComputerName='dc'}

Get-CimInstance @parameters

Get-CimInstance @parameters -Verbose









$password = Read-Host 'Give me your secret password'
$securepassword = Read-Host 'Give me your secret password in secure manner' -AsSecureString
$securepassword

$unsecuredpassword = [System.Runtime.InteropServices.Marshal]::PtrToStringUni($([System.Runtime.InteropServices.Marshal]::SecureStringToCoTaskMemUnicode($securepassword)))








[int]$number = 0
if ($number -eq 1) {write-host 'one'}


if ($number -eq 1) {write-host 'one'} else {write-host 'it is not one'}


if ($number -eq 1) {'one'} elseif ($number -eq 2) {'two'} elseif ($number -gt 2) {'three or more'}


if ($number -eq 1) {'one'} elseif ($number -eq 2) {'two'} elseif ($number -gt 2) {'three or more'} else {'zero or less'}



if ($number -eq 1) {
    'one'
} elseif ($number -eq 2) {
    'two'
} elseif ($number -gt 2) {
    'three or more'
} else {
    'zero or less'
}




$numberToAnalyze = 1112

if (($numberToAnalyze % 2) -gt 0) {
    Write-Host ('Number {0} is odd' -f $numberToAnalyze)
} else {
    Write-Host ('Number {0} is even' -f $numberToAnalyze)
}





[int]$number = 3
switch ($number) {
    0 {'zero'}
    1 {'one'}
    2 {'two'}
    3 {'three'}
}



[int]$number = 3
switch ($number) {
    0 {'zero'}
    1 {'one'}
    2 {'two'}
    3 {'three'}
    default {'its uknown number'}
}



$name = 'Jana'

switch ($name) {
    'Jan' {write-host 'Name is Jan'}
    'Martin' {write-host 'Name is Martin'}
    'Zhannat' {write-host 'Name is Zhannat'}
    default {write-host 'unknown name'}
}





$name = 'Peter'

switch -Wildcard ($name) {
    'Jan' {write-host 'Name is Jan'}
    'Martin' {write-host 'Name is Martin'}
    'Zhannat' {write-host 'Name is Zhannat'}
    "P*" {write-host 'Name starts with P'}
    default {write-host 'unknown name'}
}





$menuitems = 'create','delete','quit'

$selection = $menuitems | Out-GridView -PassThru

switch ($selection) {
    'create' {'it will create something'}
    'delete' {'it will delete something'}
    'quit' {'application quits'}
    default {'unknown selection'}
}





$number = 100
while ($number -lt 10) {
    Write-Host "number is $number"
    $number++
}


$number = 100
do {
    Write-Host "number is $number"
    $number++
} while ($number -lt 10) 




$number = 100
do {
    Write-Host "number is $number"
    $number++
} until ($number -lt 10) 







$number = 100
do {
    Write-Host "number is $number"
    $number--
} until ($number -lt 10) 





$menuitems = 'create','delete','quit'

do {
$selection = $menuitems | Out-GridView -PassThru
    switch ($selection) {
        'create' {'it will create something'}
        'delete' {'it will delete something'}
        'quit' {'application quits'}
        default {'unknown selection'}
    }
} until ($selection -eq 'quit')



$menuitems = 'create','delete','quit'

do {
$selection = $menuitems | Out-GridView -PassThru
    switch ($selection) {
        'create' {'it will create something'}
        'delete' {'it will delete something'}
        'quit' {'application quits'}
        default {'unknown selection'}
    }
} while ($selection -ne 'quit')







#infinite loop
while ($true) {
    Write-host 'here is the datetime'
    Get-Date
    write-host 'refresh in 5 seconds'
    Start-Sleep -Seconds 5
}





# for (initial; condition; step) {scriptblock}

$number++ # is the same like following:
$number = $number + 1

for ($number = 0; $number -le 100; $number++) {
    write-host "Number is $number"
} 



$letters = 'a','b','c'

for ($index = 0; $index -lt $Letters.count; $index++) {
    $Letters[$index]
}




Get-Process | ForEach-Object {
    if ($_.Name -like "*x*") {
        Write-Host ('PRocess name {0} contains x' -f $_.name)
    }
}


$processes  = Get-Process
foreach ($singleprocess in $processes) {
    if ($singleprocess.Name -like "*x*") {
        Write-Host ('PRocess name {0} contains x' -f $singleprocess.name)
    }
}



Get-Process | ForEach-Object {
    if ($_.Name -like "*x*") {
        Write-Host ('PRocess name {0} contains x' -f $_.name)
        $_ | Select-Object Name,Id,@{Name='PMMB';e={$_.PM/1MB}}
    }
}









