#run command against 2 servers?

Invoke-Command -ComputerName server1 -ScriptBlock {$env:COMPUTERNAME}
Invoke-Command -ComputerName server2 -ScriptBlock {$env:COMPUTERNAME}

Invoke-Command -ComputerName server1,server2 -ScriptBlock {$env:COMPUTERNAME}