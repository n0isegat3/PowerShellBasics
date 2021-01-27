$creds = Get-Credential
# password can be read $creds.GetNetworkCredential().Password
Get-CimInstance -ClassName win32_operatingsystem -ComputerName (New-CimSession -ComputerName dc -Credential $creds)


$answer = Read-Host -Prompt 'How old are you?'

Write-Host 'How old are you? (example: 18): ' -ForegroundColor Yellow -BackgroundColor Black -NoNewline
[int]$answer = Read-Host


$password = Read-Host -Prompt 'Give me your password!' -AsSecureString


$menuitems = 'say hi','say bye'
$answer = $menuitems | Out-GridView -PassThru
$answer