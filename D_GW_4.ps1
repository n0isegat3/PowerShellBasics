#requires -Version 7.0

[cmdletbinding()]
param(
    [Parameter(Mandatory=$true)][string]$GatewayClusterId
)

#$GatewayClusterId = '3d1e9a71-af86-4715-8cf5-f2469bf83933'

try {
    $Datasources = Get-DataGatewayClusterDatasource -GatewayClusterId $GatewayClusterId -errorAction Stop
} catch {
    Write-Host 'Error reading datasource' -ForegroundColor Red -BackgroundColor Black
}

$Results = New-Object -TypeName System.Collections.ArrayList

if ($Datasources.count -gt 0) {
    foreach ($Datasource in $Datasources) {
        try {
            $DatasourceUsers = Get-DataGatewayClusterDatasourceUser -GatewayClusterId $Datasource.Clusterid -GatewayClusterDatasourceId $_.Id -ErrorAction Stop
            }
        catch {
            Write-Host 'Error reading users from datasource' -ForegroundColor Red -BackgroundColor Black
            continue
        }
        Write-Verbose "Processing data source $($Datasource.datasourcename)"
        foreach ($DatasourceUser in $DatasourceUsers) {
            Write-Verbose "`tProcessing data source user $($DatasourceUser.Displayname)"
            $objectProps = @{
                EmailAddress = $DataSourceUser.UserEmailAddress
                DataSourceName = $Datasource.DataSourceName
                DisplayName = $DataSourceUser.Displayname
            }
            $null = $results.add((New-Object -TypeName psobject -Property $objectProps))
        }
    }​​​​
}

if ($Results.count -gt 0) {
    $Results | Format-Table
    } else {
        Write-Host 'No results available!'
    }