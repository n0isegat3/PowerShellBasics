Start-Job -Name DirListing -ScriptBlock {
    Get-ChildItem -Path C:\ -Recurse
}

#doing something else
Get-ChildItem C:\Temp
Start-Sleep -s 2

Get-Job -Name DirListing | Wait-Job
Get-Job -Name DirListing | Receive-Job




Get-Job -Name DirListing | Wait-Job -Timeout 5
Get-Job -Name DirListing | Stop-Job -PassThru | Remove-Job





Start-Job -Name TestReceive2 {
    'Some Data'
}
Get-Job -Name TestReceive2 | Receive-Job -Keep








Start-Job -Name Remote1 -ScriptBlock {
    Invoke-Command -ComputerName server1 -ScriptBlock {
        gci C:\Windows -Recurse
    }
}
Get-Job









Invoke-Command -ComputerName server1 -ScriptBlock {
    gci C:\Windows -Recurse
} -AsJob -JobName RemoteJobServer1
Get-Job
Receive-Job -Name RemoteJobServer1 -Keep
Receive-Job -Name RemoteJobServer1








Invoke-Command -ComputerName server1 -ScriptBlock {
    Start-job -name remoteserver -scriptblock {
        gci C:\Windows -Recurse
    }
}
Invoke-Command -ComputerName server1 -ScriptBlock {
    Get-Job
}
Invoke-Command -ComputerName server1 -ScriptBlock {
    Get-Job | Receive-Job
}
