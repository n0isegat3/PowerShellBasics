Invoke-Command -ComputerName dc -ScriptBlock {Get-ChildItem -Path C:\ -Recurse} -AsJob
Get-Job
Get-job | Where-Object {$_.Location -eq 'DC'} | Wait-Job
#this will continue after it is done with DC

#background jobs

Get-ChildItem -Path C:\ -Recurse

Start-Job -Name Fast -ScriptBlock {
    Get-Process
}

Start-Job -Name NoResults -ScriptBlock {
    Start-Sleep -Seconds 5
}

Start-Job -Name FullCListing -ScriptBlock {
    Get-ChildItem -Path C:\ -Recurse
}

Get-Job

Get-Job -Name FullCListing | Select-Object -ExpandProperty command

Receive-Job -Name FullCListing -Keep

Receive-Job -Name FullCListing

Stop-Job -Name FullCListing

Receive-Job -Name Fast

Get-Job | Remove-Job

Start-Job -Name FullCListingForWait -ScriptBlock {
    Get-ChildItem -Path C:\ -Recurse
}

Get-Process
Get-Service
invoke-command -ComputerName dc -ScriptBlock {Start-Sleep -Seconds 5}

Wait-Job -Name FullCListingForWait