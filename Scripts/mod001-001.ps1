Get-Command
Get-Command -Name *service*
Get-Command -Verb get

Show-Command Get-Process

Update-Help
Update-Help -Module dism

Save-Help -Module dism -DestinationPath C:\temp
Update-Help -SourcePath C:\temp

Get-Help
Get-Help -Name Get-Service
Get-Help -Name Get-Process -ShowWindow
Get-Help -Name Get-Process -Online
Get-Help -Name Get-Process -Parameter Name
Get-Help About_Pester

'text'
"text"

Get-Command `
    -Verb Get `
    -Noun Service

#this is comment

<# this
is
block
comment
#>