try {
    $process = Get-Process -Name nonexistingprocess -ErrorAction Stop
    }
catch {
    Write-Host 'There is an error!'
}



$procname = 'nonexistingprocess'
$procname = 'csrss'
try {
    $process = Get-Process -Name $procname  -ErrorAction Stop
    }
catch {
    Write-Host 'There is an error!'
}
finally {
    Write-Host 'This will be executed every time'
}