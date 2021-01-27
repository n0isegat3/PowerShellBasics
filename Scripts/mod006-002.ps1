#scheduled jobs
#these are not Scheduled Tasks


$ScheduledJobOption = New-ScheduledJobOption -RunElevated -HideInTaskScheduler -StartIfOnBattery -RequireNetwork
$ScheduledJobOption

$JobTrigger = New-JobTrigger -AtLogOn
$JobTrigger

Register-ScheduledJob -Name CreateRandomFolder -Trigger $JobTrigger -ScheduledJobOption $ScheduledJobOption -ScriptBlock {
    New-Item -ItemType Directory -Path C:\ -Name (Get-Random)
}

Get-ScheduledJob
Get-ScheduledJob | Get-ScheduledJobOption

Get-Job