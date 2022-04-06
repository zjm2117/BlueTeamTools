while($True){
	$ST1 = 20 # This is the time the NIC is disabled
	$ST2 = 10 # This is the time the NIC is enabled
	Write-Output "Disabling NIC"
	Disable-NetAdapter -Name "Ethernet0" -Confirm:$False
	Write-Output "Sleeping for $ST1 seconds"
	Start-Sleep $ST1
	Write-Output "Enabling NIC"
	Enable-NetAdapter -Name "Ethernet0" -Confirm:$False
	Write-Output "Sleeping for $ST2 seconds"
	Start-Sleep $ST2
}
