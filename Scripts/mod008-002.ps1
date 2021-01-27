param(
    $ProcessName = 'powershell'
)

Get-Process -Name $ProcessName | Stop-Process -WhatIf