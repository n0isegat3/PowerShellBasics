if ($number -eq 1) {
    Write-Host 'It is ONE'
} elseif ($number -eq 2) {
    Write-Host 'It is TWO'
} elseif ($number -eq 3) {
    Write-Host 'It is three'
} elseif ($number -eq 4) {
    Write-Host 'It is four'
} else {
    Write-Host 'It is neither ONE nor TWO nor THREE nor FOUR'
}



$number = 5
switch ($number) {
    1 {Write-Host 'It is ONE'}
    2 {Write-Host 'It is TWO'}
    3 {Write-Host 'It is THREE'}
    4 {Write-Host 'It is FOUR'}
    default {Write-Host 'It is neither ONE nor TWO nor THREE nor FOUR'}
}

$number = 1,4
switch ($number) {
    1 {Write-Host 'It is ONE'}
    2 {Write-Host 'It is TWO'}
    3 {Write-Host 'It is THREE'}
    4 {Write-Host 'It is FOUR'}
    default {Write-Host 'It is neither ONE nor TWO nor THREE nor FOUR'}
}


$number = 'one'
switch ($number) {
    'one' {Write-Host 'It is ONE'}
    'two' {Write-Host 'It is TWO'}
    'three' {Write-Host 'It is THREE'}
    'four' {Write-Host 'It is FOUR'}
    default {Write-Host 'It is neither ONE nor TWO nor THREE nor FOUR'}
}

$number = 'fourteen'
switch -Wildcard ($number) {
    'one' {Write-Host 'It is ONE'}
    'two' {Write-Host 'It is TWO'}
    'three' {Write-Host 'It is THREE'}
    'four' {Write-Host 'It is FOUR'}
    "four*" {Write-Host 'It is FOUR-something'}
    default {Write-Host 'It is neither ONE nor TWO nor THREE nor FOUR'}
}



$menuitems = 'say hi','say bye'
switch ($menuitems | Out-GridView -PassThru) {
    'say hi' {Write-host 'Hiiii!!!!'}
    'say bye' {Write-host 'Goodbye!'}
}