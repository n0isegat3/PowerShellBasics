$number = 2

#if (condition) {scriptblock if condition returns True}

if ($number -eq 1) {
    Write-Host 'It is ONE'
}

#if (condition) {scriptblock if condition returns True} else {scriptblock if condition returns False}

if ($number -eq 1) {
    Write-Host 'It is ONE'
} else {
    Write-Host 'It is not ONE'
}

#if (condition) {scriptblock if condition returns True} elseif (condition2) {scriptblock if condition2 returns True}

if ($number -eq 1) {
    Write-Host 'It is ONE'
} elseif ($number -eq 2) {
    Write-Host 'It is TWO'
}

#if (condition) {scriptblock if condition returns True} elseif (condition2) {scriptblock if condition2 returns True} else {scriptblock if condition returns False and condition2 returns False}

if ($number -eq 1) {
    Write-Host 'It is ONE'
} elseif ($number -eq 2) {
    Write-Host 'It is TWO'
} else {
    Write-Host 'It is neither ONE nor TWO'
}


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

#Is number odd or even?
$n = 3
if (($n % 2) -gt 0) {
    Write-Host "$n is odd number"
} else {
    Write-Host "$n is even number"
}