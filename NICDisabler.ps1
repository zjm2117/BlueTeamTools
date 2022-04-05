while($True){
	$ST1 = 20
	$ST2 = 10
	Write-Output "Disabling"
	Disable-NetAdapter -Name "Ethernet0" -Confirm:$False
	Write-Output "Sleeping $ST1"
	Start-Sleep $ST1
	Write-Output "Enabling"
	Enable-NetAdapter -Name "Ethernet0" -Confirm:$False
	Write-Output "Sleeping $ST2"
	Start-Sleep $ST2
}
