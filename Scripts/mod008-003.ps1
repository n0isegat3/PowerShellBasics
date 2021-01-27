param(
    [string]$ProcessName
)

Get-Process -Name $ProcessName | Stop-Process -WhatIf