﻿$GatewayClusterId = '3d1e9a71-af86-4715-8cf5-f2469bf83933'

try {
    $Datasources = Get-DataGatewayClusterDatasource -GatewayClusterId $GatewayClusterId -errorAction Stop
} catch {
    Write-Host 'Error reading datasource'
}

$Results = New-Object -TypeName System.Collections.ArrayList

if ($Datasources.count -gt 0) {
    foreach ($Datasource in $Datasources) {
        try {
            $DatasourceUsers = Get-DataGatewayClusterDatasourceUser -GatewayClusterId $Datasource.Clusterid -GatewayClusterDatasourceId $_.Id -ErrorAction Stop
            }
        catch {
            Write-Host 'Error reading users from datasource'
            continue
        }
        Write-host "Processing data source $($Datasource.datasourcename)" -ForegroundColor Yellow
        foreach ($DatasourceUser in $DatasourceUsers) {
            Write-host "`tProcessing data source user $($DatasourceUser.Displayname)" -ForegroundColor Yellow
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