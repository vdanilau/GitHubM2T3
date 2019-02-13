#1.5.	Создать один скрипт, объединив 3 задачи:
#1.5.1.	Сохранить в CSV-файле информацию обо всех обновлениях безопасности ОС.
#1.5.2.	Сохранить в XML-файле информацию о записях одной ветви реестра HKLM:\SOFTWARE\Microsoft.
#1.5.3.	Загрузить данные из полученного в п.1.5.1 или п.1.5.2 
#файла и вывести в виде списка  разным разными цветами

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
