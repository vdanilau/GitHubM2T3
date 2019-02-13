#1.3.	Вывести список из 10 процессов занимающих дольше всего процессор. 
#Результат записывать в файл.

param(
      #[parameter (mandatory=$true)]   
      [string]$File="C:\"
      )

if (Test-Path $File )   
 {
    $CPUTime=Get-Process | Sort-Object CPU -Descending  | `
  Select-Object -first 10
    $CPUTime | Out-File $File\CPUtime.txt
  }
else 
    {Write-Output "The directory doesn't exist"}



