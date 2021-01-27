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























$ScheduledJobOption = New-ScheduledJobOption -RunElevated -HideInTaskScheduler -StartIfOnBattery

$trigger = New-JobTrigger -AtLogOn


Register-ScheduledJob -Name CreateRandomFolder -Trigger $trigger -ScheduledJobOption $ScheduledJobOption -ScriptBlock {
    New-Item -ItemType Directory -Path C:\ -Name (Get-Random)
}

Get-ScheduledJob
Get-ScheduledJob | Get-ScheduledJobOption
Get-ScheduledJob | Select-Object -ExpandProperty Command

Get-Job | Receive-Job

Get-Job | select Id,Name,PSEndTime,PSBeginTime
Get-Job | Sort-Object -Property PSEndTime | select Id,Name,PSEndTime -Last 1
Get-Job | Sort-Object -Property PSEndTime | select -Last 1 |Receive-Job

#filepath of job config: $env:userprofile\AppData\Local\Microsoft\Windows\PowerShell\ScheduledJobs\CreateRandomFolder