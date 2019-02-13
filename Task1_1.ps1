#1.1.	Сохранить в текстовый файл на диске список запущенных(!) служб. 
#Просмотреть содержимое диска. Вывести содержимое файла в консоль PS.


Param(
      [parameter(mandatory=$true)] 
      [string]  $File="C:\"
      )
if (Test-Path $File )   
 {
     Get-Service | where status -EQ running | `
     Out-File $File\serv.txt
  }
else 
    {Write-Output "The directory doesn't exist"}
    