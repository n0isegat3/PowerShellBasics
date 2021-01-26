#region working with strings
'My first name is {0} and my lastname is {1}' -f 'Jan','Marek'
'My first name is {1} and my lastname is {0}' -f 'Marek','Jan'





$FN = 'Jan'
$LN = 'Marek'
'My first name is {0} and my lastname is {1} and I have $100' -f $FN,$LN
'My first name is {1} and my lastname is {0} and I have $100' -f $LN,$FN

"My first name is $FN and my lastname is $LN and I have $100"
"My first name is $FN and my lastname is $LN and I have `$100"
#endregion


Get-Service -ComputerName server1

Get-Process -ComputerName server1


Get-WmiObject -ComputerName server1 -Class win32_bios

Get-CimInstance -ComputerName server1 -ClassName win32_bios


$dacreds = Get-Credential -Message 'Provide domain admin creds' -UserName "$($env:USERDOMAIN)\xx-$($env:username)"

$dacreds = Get-Credential -Message 'Provide domain admin creds' -UserName ('{0}\xx-{1}' -f $env:USERDOMAIN,$env:username)

$dacreds.UserName
$dacreds.Password
$dacreds.GetNetworkCredential().Password


Enter-PSSession -ComputerName server1

get-help Enter-PSSession -Parameter credential


Enter-PSSession -ComputerName server1 -Credential (Get-Credential)

Enter-PSSession -ComputerName server1 -Credential $dacreds 







#CLIENT1    ---->     MANAGEMENT SERVER      ----->      ADDC

Enter-PSSession -ComputerName server1














$sess = New-PSSession -Name SessToServer2  -ComputerName server2
Get-PSSession

Enter-PSSession -Session $sess



New-PSSession -Name SessToServer2  -ComputerName server2
Get-PSSession

Enter-PSSession -Session (Get-PSSession -Name SessToServer2)
Enter-PSSession -Session (Get-PSSession -Name SessToServer2)
Enter-PSSession -Session (Get-PSSession -Name SessToServer2)


ipconfig
Get-NetIPConfiguration

$creds = Get-Credential
Invoke-Command -ComputerName server2 -Credential $creds -ScriptBlock {ipconfig}
Invoke-Command -ComputerName server2 -ScriptBlock {ipconfig}
New-PSSession -Name SessToServer2  -ComputerName server2
Get-PSSession
Invoke-Command -Session (Get-PSSession -Name SessToServer2) -ScriptBlock {ipconfig} 



$FolderName = 'Test123'
New-Item -ItemType Directory -Path C:\ -Name $FolderName

Invoke-Command -Session (Get-PSSession -Name SessToServer2) -ScriptBlock {
   #New-Item -ItemType Directory -Path C:\ -Name $FolderName
   Write-Host ('Foldername var contains: {0}' -f $FolderName)
} 








$FolderName = 'Test123'
$FolderName2 = 'Test456'

Invoke-Command -Session (Get-PSSession -Name SessToServer2) -ScriptBlock {
   Write-Host ('Foldername var contains: {0}' -f $args[1])

} -ArgumentList $FolderName,$FolderName2










$FolderName = 'Test123'
$FolderName2 = 'Test456'

Invoke-Command -Session (Get-PSSession -Name SessToServer2) -ScriptBlock {
   Write-Host ('Foldername var contains: {0}' -f $using:FolderName)
   Write-Host ('Foldername2 var contains: {0}' -f $using:FolderName2)
}





