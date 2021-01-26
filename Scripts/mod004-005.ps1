New-PSSession -ComputerName dc -Credential (Get-Credential -UserName 'rangers\ea' -Message 'As an enterprise admin') -Name ea
New-PSSession -ComputerName dc -Credential (Get-Credential -UserName 'rangers\da' -Message 'As a domain admin') -Name da
$sessionVariable = New-PSSession -ComputerName dc


Get-PSSession




Enter-PSSession -Name ea
    #$env:username
Enter-PSSession -Name da
    #$env:username
$sessionVariable | Enter-PSSession
    #$env:username
Get-PSSession -Id 43 | Enter-PSSession



Invoke-Command -Session (Get-PSSession -Name da) -ScriptBlock {$env:username}
Invoke-Command -Session (Get-PSSession -Name ea) -ScriptBlock {$env:username}

Disconnect-PSSession -Name da
Get-PSSession

Get-Process | select -f 2 #just to do something

Connect-PSSession -Name da
Get-PSSession


Remove-PSSession -Name ea
Get-PSSession | Remove-PSSession