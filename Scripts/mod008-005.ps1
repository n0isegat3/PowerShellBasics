[cmdletbinding()]
param(
    [Parameter(Mandatory)][string]$ProcessName
)

Write-Verbose 'Script started'

Write-Verbose 'going to find a process'

Get-Process -Name $ProcessName | Select-Object -Property ProcessName,Id

Write-Host ('Script completed at {0} for process name {1}' -f (Get-Date),$ProcessName)