param(
    [Parameter(Mandatory)][string]$Path
)

try {
    Get-ChildItem -Path $Path -Include *.exe -Recurse -ErrorAction Stop | Select-Object -ExpandProperty Fullname
    }
catch {
    Write-Host ('Error searching executables in {0}.{1}' -f $Path,$Error[0].Exception.Message)
}