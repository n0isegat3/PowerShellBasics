# takhle by to vypadalo v ramci celeho skriptu

New-PSSession -ComputerName dc -Name SesnaProtiDCcku #bud takto nebo nasledujicim zpusobem
$sessionobject = New-PSSession -ComputerName dc
$SesnaSJinymiCredentials = New-PSSession -ComputerName dc -Credential (Get-Credential)
Get-PSSession

#delam neco

Invoke-Command -Session (Get-PSSession -Name SesnaProtiDCcku) -ScriptBlock {gci HKLM:\Software}  #bud takto nebo nasledujicim zpusobem
Invoke-Command -Session $sessionobject -ScriptBlock {gci HKLM:\Software}

#neco jineho

Invoke-Command -Session $sessionobject -ScriptBlock {whoami}
Invoke-Command -Session $SesnaSJinymiCredentials -ScriptBlock {whoami}

$sessionobject | Disconnect-PSSession

#delam neco jineho

$sessionobject | Connect-PSSession

Invoke-Command -Session $sessionobject -ScriptBlock {gci HKLM:\HARDWARE}

#dalsi halda kodu
Invoke-Command -Session $sessionobject -ScriptBlock {gci C:\}


#jeste kod

Invoke-Command -Session $sessionobject -ScriptBlock {gci C:\Windows}

#uz bude konec

$sessionobject | Remove-PSSession
$SesnaSJinymiCredentials | Remove-PSSession
Remove-PSSession -Name SesnaProtiDCcku


Get-PSSession | Remove-PSSession