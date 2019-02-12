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