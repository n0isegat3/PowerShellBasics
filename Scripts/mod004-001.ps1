Enter-PSSession -ComputerName dc

Enter-PSSession -ComputerName dc -Credential (Get-Credential -Message 'provide creds for DC' -UserName 'rangers\ea')

Enter-PSSession -ComputerName dc -Credential (New-Object -TypeName pscredential `
    -ArgumentList ('rangers\da',(ConvertTo-SecureString -String 'P@ssw0rd' -AsPlainText -Force)))

Invoke-Command -ComputerName dc -Credential (Get-Credential) -ScriptBlock {Get-Volume}