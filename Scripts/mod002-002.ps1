#object processing
Get-Process | Sort-Object -Property Name -Descending

Get-Process | Select-Object -Property Name,ID
Get-Process | Select-Object -Property Name -Unique
Get-Process | Select-Object -ExpandProperty Name
Get-Process | Select-Object -First 4
Get-Process | Select-Object -Property * -ExcludeProperty Id

Get-Process | Group-Object -Property Name

Get-Process -Name 'conhost'
Get-Process | Where-Object -Property Name -EQ -Value 'conhost'
Get-Process | Where-Object {$_.Name -eq 'conhost'}

Get-Process | ForEach-Object {Write-Host "Process name is $($_.name)"}
Get-ChildItem -Path 'C:\Temp\ToEncrypt' | ForEach-Object {$_.Encrypt()}
Get-ChildItem -Path 'C:\Temp\ToEncrypt' | ForEach-Object -MemberName Encrypt

#output formatting
Get-Process | Format-Table -Property Name,Id
Get-Service | Format-Table -Property Name,DisplayName,Status -AutoSize -Wrap

Get-Process | Format-List -Property *

Get-Process | Format-Wide -Property id

#output processing
Get-Process | Out-File 'C:\Temp\processes1.txt'
Get-Process | Out-File 'C:\Temp\processes1.txt' -Append
Get-Process | Out-Host -Paging
Get-Process | Out-Printer -Name 'MyPrinter1'
Get-Process | Out-GridView
Get-Process | Out-GridView -Title 'Processes'  -PassThru | Out-GridView

Get-Process | ConvertTo-Csv | Out-File 'C:\temp\processes2.csv'
Get-Process | Export-CSV 'C:\temp\processes2.csv' -Delimiter "`t"
Get-Process | Select-Object -f 1 -Property name,id | ConvertTo-Json

Get-Process | Select-Object -f 3 -Property name,id | ConvertTo-Html -Title 'Processes' -PreContent (Get-Date) | Out-File 'C:\temp\processes.htm'