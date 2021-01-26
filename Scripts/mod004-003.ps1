$NameOfProcess = 'svchost'
$SecondVariable = 'Text2'

$NameOfProcess

Enter-PSSession -ComputerName dc

Invoke-Command -ComputerName dc -ScriptBlock {Write-Host $NameOfProcess}

Invoke-Command -ComputerName dc -ScriptBlock {Write-Host $NameOfProcess} -ArgumentList $NameOfProcess

Invoke-Command -ComputerName dc -ScriptBlock {Write-Host $args} -ArgumentList $NameOfProcess,$SecondVariable,'Text3'

Invoke-Command -ComputerName dc -ScriptBlock {Write-Host $args[0]} -ArgumentList $NameOfProcess,$SecondVariable,'Text3'
Invoke-Command -ComputerName dc -ScriptBlock {Write-Host $args[1]} -ArgumentList $NameOfProcess,$SecondVariable,'Text3'
Invoke-Command -ComputerName dc -ScriptBlock {Write-Host $args[2]} -ArgumentList $NameOfProcess,$SecondVariable,'Text3'



Invoke-Command -ComputerName dc -ScriptBlock {
    param(
        $ValueOf1stArgument,
        $ValueOf2ndArgument,
        $ValueOf3rdArgument
    )
    
    Write-Host $ValueOf3rdArgument
    
    } -ArgumentList $NameOfProcess,$SecondVariable,'Text3'


Invoke-Command -ComputerName dc -ScriptBlock {
    param(
        $NameOfProcess,
        $SecondVariable,
        $ValueOf3rdArgument
    )
    
    Write-Host $NameOfProcess
    
    } -ArgumentList $NameOfProcess,$SecondVariable,'Text3'