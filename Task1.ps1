Param(
       [string]$File="C:\"
      )
if (Test-Path $File )   
    {
     Get-Service | where status -EQ running | `
     Out-File $file\serv.txt
     }