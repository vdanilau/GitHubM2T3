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

