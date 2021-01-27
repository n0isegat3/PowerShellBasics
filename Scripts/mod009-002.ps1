function Get-Executables {
   [cmdletbinding()]
   param(
    [Parameter(Mandatory)]
    [ValidateScript({
        if (!$(Test-Path -Path $_)) {
            throw 'Path does not exist'
        }
        return $true
    }
    )]
    [string]$Path,
    [switch]$ShowMeCount
    )

    $starttime = Get-Date

    try {
        $Executables = Get-ChildItem -Path $Path -Include *.exe -Recurse -ErrorAction Stop | Select-Object -ExpandProperty Fullname
        $Executables
        if ($ShowMeCount) {
            $Executables.count
        }
        }
    catch {
        Write-Host ('Error searching executables in {0}. {1}' -f $Path,$Error[0].Exception.Message)
    }

    $executiontime = $(get-date) - $starttime
    Write-Verbose ('Script took {0} seconds' -f $executiontime.totalseconds)
}

Get-Executables -Path 'C:\Program Files\Internet Explorer' -Verbose

Get-Executables -Path 'C:\Program Files\Internet Explorer' -ShowMeCount -Verbose

Get-Executables -Path 'C:\Program Files\IE' -Verbose