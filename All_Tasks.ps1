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


#1.2.	Просуммировать все числовые значения переменных среды Windows. (Параметры не нужны)
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

#1.3.1.	Организовать запуск скрипта каждые 10 минут
[string]$P=Read-Host ("Path to your Script.ps1")
$date=get-date
$Trig= New-JobTrigger -Once -At $date `
        -RepetitionInterval (New-TimeSpan -Minutes 2) `
        -RepetitionDuration (New-TimeSpan -Hours 1) 

Register-ScheduledJob -Name Get_CPUTime -FilePath $P `
                         -Trigger $Trig  

#Remove-JobTrigger -Name "Get_CPU*" 
#Unregister-ScheduledJob Get_CPUTime  

#1.4.	Подсчитать размер занимаемый файлами в папке 
#(например C:\windows) за исключением файлов 
#с заданным расширением(напрмер .tmp)
[Cmdletbinding(PositionalBinding=$false)]
param (
        [string]$File= "C:\Windows",
        [string]$EF="*tmp"
        )
if (Test-Path $File)
{
  $m=Get-ChildItem -Path $File -Recurse -Exclude $EF -Force `
  -ErrorAction SilentlyContinue | `
   measure -Property Length -Sum 
   write-output ("sum=" + $m.sum/1Gb + "Gb")
}           
else
    {
    Write-Output "The directory doesn't exist"
    }

#1.5.	Создать один скрипт, объединив 3 задачи:
#1.5.1.	Сохранить в CSV-файле информацию обо всех обновлениях безопасности ОС.
#1.5.2.	Сохранить в XML-файле информацию о записях одной ветви реестра HKLM:\SOFTWARE\Microsoft.
#1.5.3.	Загрузить данные из полученного в п.1.5.1 или п.1.5.2 файла и 
#вывести в виде списка  разным разными цветами
param(
      [string]$file="C:"
      )

if (Test-Path $file)
{
    Get-Hotfix | where description -EQ "Security Update" |`
     Export-Csv -Path $file\get-hotfix.csv
    
    Get-ChildItem -Path HKLM:\SOFTWARE\Microsoft | `
    Export-Clixml -Path $file\get-hklm.xml
}

$s=Import-csv $file\get-hotfix.csv |  fl | Out-String
Write-Host $s -ForegroundColor Yellow

#2.1.	Создать профиль
#2.2.	В профиле изненить цвета в консоли PowerShell`
#2.3.	Создать несколько собственный алиасов
#2.4.	Создать несколько констант
#2.5.	Изменить текущую папку
#2.6.	Вывести приветсвие
#2.7.	Проверить применение профиля
New-Item -ItemType file -Path $profile -force
 "(Get-Host).UI.RawUI.ForegroundColor = 'green' `n ` #цвет шрифта
 (Get-Host).UI.RawUI.BackgroundColor = 'black' `n `  #цвет фона
  Set-Alias HelpMе Get-Help `n `                    #алиас №1
  Set-Alias gta Get-process `n `                    #алиас №2
  Set-Variable –name pi –value 3.1415 `n `           #константа 1
  Set-Variable –name Fid  –value 1,618 `n `          #константа 2
   Set-Location C:\ `n `                            #Изменить текущую папку
  Write-Host ″Hello, my friend !!!″ `n `             #Вывести приветсвие
   " | `
 Out-File -Append -FilePath $profile                #добавили в профайл
 notepad $profile                                   #вывели файл профайла
 Stop-Process -Name powershell_ise                  #остановили PS

#3.	Получить список всех доступных модулей
Get-Module -ListAvailable
