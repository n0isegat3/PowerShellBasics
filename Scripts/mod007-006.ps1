#while (condition) {scriptblock to run while condition is true}

$number = 0
while ($number -lt 10) {
    Write-Host "Number is $number"
    $number++ #same as $number = $number + 1
}

#do {scriptblock to run while condition is true} while (condition)
$number = 20
while ($number -lt 10) {
    Write-Host "Number is $number"
    $number++ #same as $number = $number + 1
}

$number = 20
do {
    Write-Host "Number is $number"
    $number++
} while ($number -lt 10)

#do {scriptblock to run until condition is true} until (condition)
$number = 0
do {
    Write-Host "Number is $number"
    $number++
} until ($number -lt 10)