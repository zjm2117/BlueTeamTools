$services = @("W32Time", "Netlogon", "DNS", "TrkWks", "LanmanWorkstation", "IsmServ","ADWS","DFSR","Kdc","NTDS", "LanmanServer","DFS")
foreach($service in $services){
	start-service $service
	set-service $service -status Running -StartupType Automatic
}