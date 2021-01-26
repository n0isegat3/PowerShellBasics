Get-PSProvider
Get-PSProvider | Format-Table -Property Name,Capabilities -AutoSize -Wrap



Get-PSDrive
New-PSDrive -Name 'windir' -PSProvider FileSystem -Root 'C:\Windows'
New-PSDrive -Name 'HKU' -PSProvider Registry -Root HKEY_USERS

Set-Location windir:
Set-Location hku:
Set-Location env:



New-PSDrive -Name S -PSProvider FileSystem -Root \\dc\c$ -Persist