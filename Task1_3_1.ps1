[string]$P=Read-Host ("Path to your Script.ps1")
$date=get-date
$Trig= New-JobTrigger -Once -At $date `
        -RepetitionInterval (New-TimeSpan -Minutes 2) `
        -RepetitionDuration (New-TimeSpan -Hours 1) 

Register-ScheduledJob -Name Get_CPUTime -FilePath $P `
                         -Trigger $Trig  

#Remove-JobTrigger -Name "Get_CPU*" 
#Unregister-ScheduledJob Get_CPUTime  