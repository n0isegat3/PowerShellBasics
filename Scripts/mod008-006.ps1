[cmdletbinding()]
param(
    [Parameter(Mandatory)][string]$ProcessName
)

Start-Transcript

Clear-Host

Write-Verbose 'Script started'

Write-Verbose 'going to find a process'

$error.clear()
try {Get-Process -Name $ProcessName -ErrorAction Stop | Select-Object -Property ProcessName,Id}
catch {
    Write-Host ('Something wrong happened during get-process. Error: {0}' -f $error[0].exception.message) -ForegroundColor black -BackgroundColor red
}

Write-Host ('Script completed at {0} for process name {1}' -f (Get-Date),$ProcessName) -ForegroundColor Magenta

Stop-Transcript