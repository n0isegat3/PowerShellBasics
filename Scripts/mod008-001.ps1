param(
    $ProcessName
)

Get-Process -Name $ProcessName | Stop-Process -WhatIf