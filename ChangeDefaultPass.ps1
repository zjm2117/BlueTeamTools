$PasswordChanges = @('munson',
					'sumita',
					'pelletier',
					'olson',
					'stackpole',
					'weissman','hamza',
					'brigden',
					'park',
					'student',
					'lab-worker',
					'ta',
					'ga')
$NewPassword = "Bingus01!"			
foreach ($user in $PasswordChanges){
	try {
		Set-ADAccountPassword -Identity $user -NewPassword (ConvertTo-SecureString -AsPlainText $NewPassword -Force) 
		Write-Output "Successfully changed password for $user"
	} catch {
		Write-Output "User: $user doesn't exist"
	}
}
Write-Output "Done"