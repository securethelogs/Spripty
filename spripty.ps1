$logo = @('

  _________            .__        __          
 /   _____/____________|__|______/  |_ ___.__.
 \_____  \\____ \_  __ \  \____ \   __<   |  |
 /        \  |_> >  | \/  |  |_> >  |  \___  |
/_______  /   __/|__|  |__|   __/|__|  / ____|
        \/|__|            |__|         \/     

Creator: Securethelogs.com      @Securethelogs

')

$logo

Write-Output "Current Processes Running...."
Write-Output ""
Write-Output "This sessionID : $PID"
Write-Output ""


get-process | where-object {$_.ProcessName -eq "Powershell" -or $_.ProcessName -eq "cmd"} | Select-Object Description, Path, Id | Format-Table


$a= @(Get-ChildItem C:\ | Where-Object {$_.Name -ne "Windows" -and $_.Name -ne "Program Files" -and $_.Name -ne "Program Files (x86)"})

$format = Read-Host -Prompt "Select a script format (Example: .ps1)"

Write-Output "Finding Scripts....."

Start-Sleep -Seconds 2


foreach ($i in $a){

Get-Childitem -Path $i.FullName -Recurse -force -ErrorAction SilentlyContinue -Include *$format

}

