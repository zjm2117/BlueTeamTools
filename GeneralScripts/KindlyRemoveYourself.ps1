# Remove kindtime
try{
	$kindinfo = (Get-ItemProperty -Path "HKLM:\Software\WOW6432Node\kindtime")
	write-output "Port: " $kindinfo.pt
	write-output "HostIP: " $kindinfo.eip
	write-output "TargetIP: " $kindinfo.ipa
	Remove-Item -Path HKLM:\Software\WOW6432Node\kindtime -Force -Recurse
} catch {
	Write-Output "kindtime regkey not found, they renamed it to something else"
}
# Remove lsainstall
try {
	$path = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "Notification Packages"
	$UpdatedValue = "rassfm`r`nscecli"
	Set-ItemProperty -Path $Path.PSPath -Name "Notification Packages" -Value $UpdatedValue -Force
} catch {
	Write-Output "Lsa key couldn't be updated"
}
# Remove wlinstall
try {
	$path = Get-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\NetworkProvider\Order" -Name PROVIDERORDER
	$UpdatedValue = "RDPNP,LanmanWorkstation"
	Set-ItemProperty -Path $Path.PSPath -Name "PROVIDERORDER" -Value $UpdatedValue
	Remove-Item -Path HKLM:\SYSTEM\CurrentControlSet\Services\password -Force -Recurse
} catch {
	Write-Output "wlinstall couldn't be removed"
}
$NosferatuMsg = "Check for the following Keys:
HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe\ /v GlobalFlag /t REG_DWORD /d 512 /f
↑↑↑ Shouldn't have anything but 'MinimumStackCommitInBytes' ↑↑↑

HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SilentProcessExit\svchost.exe\ /v ReportingMode /t REG_DWORD /d 1 /f
↑↑↑ Remove the ReportingMode key & value ↑↑↑

\HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SilentProcessExit\svchost.exe\ /v MonitorProcess /d \C:\Windows\Provisioning\schemas\dvapi32.exe C:\Windows\Provisioning\schemas\ipsads.dll\
↑↑↑ Remove the MonitorProcess key & value ↑↑↑" 

Write-Output $NosferatuMsg
