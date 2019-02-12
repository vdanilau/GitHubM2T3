Param(
       [string]$File="C:\"
      )


if (Test-Path $File )   
#if (Test-Path "C:\") 
    {
     Get-Service | where status -EQ running | `
     Out-File $file\serv.txt
     }