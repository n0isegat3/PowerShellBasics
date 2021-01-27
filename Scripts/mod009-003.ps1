$Path = 'C:\Test'



if ((Test-Path -Path $Path) -eq $false) {
    Write-Host 'Path does not exist'
}


if (!$(Test-Path -Path $Path)) {
    Write-Host 'Path does not exist'
}


if (-not (Test-Path -Path $Path)) {
    Write-Host 'Path does not exist'
}