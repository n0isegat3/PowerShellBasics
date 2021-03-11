Enter-PSSession -ComputerName dc | Out-GridView #pipe is for nothing

Invoke-Command -ComputerName dc -ScriptBlock {Get-Volume} | Out-File -FilePath 'C:\test1.txt' #file will be on my client

Invoke-Command -ComputerName dc -ScriptBlock {Get-Volume | Out-File -FilePath 'C:\test1_on_DC.txt'} #file will be on DC

Invoke-Command -ComputerName dc -ScriptBlock {Get-Volume} | ConvertTo-Json #json conversion done on my client

Invoke-Command -ComputerName dc -ScriptBlock {Get-Volume | ConvertTo-Json} #json conversion done on DC