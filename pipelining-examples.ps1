#naplneni property v zavislosti na hodnote jine property
Get-Process | Select-Object ProcessName,`
    @{n='id procesu chrome';e={if ($_.processname -eq 'chrome') {$_.id} else {-1}}}



# union dvou kolekci objektu
notepad C:\temp\processinfo.csv #pouze pro vyrobeni dat. to csv bude mit nasledujici obsah:
<#
processnamevinfu	info
chrome	prohlizec
svchost	tech je moc
#>
$info = Import-Csv C:\temp\processinfo.csv -Delimiter "`t"

Get-Process | select ProcessName,Id,@{n='info';e={

    $procname = $_.processname

    $info | Where-Object {$_.processnamevinfu -eq $procname} | Select-Object -ExpandProperty info

    }
}