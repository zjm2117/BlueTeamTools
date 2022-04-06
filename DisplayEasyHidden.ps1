$Spacer = "_" * 200
Write-Output "Displaying running tasks: "
Get-ScheduledTask | ? state -eq running
Write-Output "$Spacer"
Write-Output "Displaying all tasks sorted by date: "
Get-ScheduledTask | Get-ScheduledTaskInfo | Sort-Object -Property "LastRunTime" | Format-Table
Write-Output "$Spacer"
Write-Output "Displaying all run keys: "
Get-Item -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Run | Select-Object -ExpandProperty Property
Get-Item -Path Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run | Select-Object -ExpandProperty Property
Get-Item -Path Registry::HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce | Select-Object -ExpandProperty Property
Get-Item -Path Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\RunOnce | Select-Object -ExpandProperty Property