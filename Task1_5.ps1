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

$s=Import-csv $file\get-hotfix.csv 
 
ForEach ($i in $s)  {Write-Host $i.Description  $i.HotFixID  $i.InstalledOn}

             
    




