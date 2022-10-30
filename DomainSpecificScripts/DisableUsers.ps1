$ProtectedUsers = @('munson',
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
					'ga',
					'grader',
					'Administrator',
					'Guest',
					'DefaultAccount',
					'krbtgt',
					'grayteam')
$AllUsers = @((get-aduser -filter * -properties 'enabled').name)
while($true){
	foreach ($user in $AllUsers){
		try {
			if(!($ProtectedUsers -contains $user)){
				Disable-ADAccount '$user' 
				Write-Output 'Disabling user: $user'
			}
		} catch {
			Write-Output 'How did it even get here?'
		}
	}
	sleep 1
}
