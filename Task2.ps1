Param(
[string]$type = "int"
      )
$var=$null
$sum=$null
$var = Get-Variable | where Value -Is [$type]
foreach ($i in $var.Value) {
        $sum+=$i}
if ($sum)
{
    Write-Output sum=$sum
 }
 else
 {
    Write-Output "Digital Variables of the Type didn't found"
  }