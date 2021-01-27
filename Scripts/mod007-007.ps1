#for (initial state; condition; step) {what to do during the loop}

#show all numbers 0-100
for ($t = 0; $t -le 100; $t++) {
    Write-Host "T is $t"
}

#show all numbers 100-0
for ($t = 100; $t -ge 0; $t--) {
    Write-Host "T is $t"
}

$ArrayFor = 'one','two','three'
$ArrayFor[0] #just to show you how you can enumerate thru array
for ($index = 0; $index -lt $ArrayFor.Count; $index++) {
    Write-Host "Content of item number $index is $($ArrayFor[$index])"
}

#-----------------------------------

Get-Process | ForEach-Object {Write-Host "Name of process is $($_.ProcessName)"}

foreach ($foreachtemp in (Get-Process)) {
    Write-Host "Name of process is $($foreachtemp.ProcessName)"
}


# --------------------------------- 
# cleanup the variable
$VariableToCleanup = 100
Remove-Variable -Name VariableToCleanup
$VariableToCleanup = $null