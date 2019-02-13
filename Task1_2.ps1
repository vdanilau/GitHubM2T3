1.2.	Просуммировать все числовые значения переменных среды Windows. (Параметры не нужны)
#Сделал с параметрами, т.к. тогда какое отличие от задания Last Task, кроме как процесса 
#самого запуска скрипта?

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