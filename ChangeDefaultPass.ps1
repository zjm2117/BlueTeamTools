$users = @('munson','sumita','pelletier','olson','stackpole','weissman','hamza','brigden','park','student','lab-worker','ta','ga','grader')
$c = 0
$OldPassword = Password123!
$NewPassword = bingus01!
foreach ($user in $users){
	Write-Output $user
	try {Get-Aduser $user
		Set-ADAccountPassword -Identity $user -OldPassword (ConvertTo-SecureString -AsPlainText $OldPassword -Force) -NewPassword (ConvertTo-SecureString -AsPlainText $NewPassword -Force)
	}
	catch {
		Write-Output "User doesn't exist"
	}
	finally{
		
	}
}
Write-Output "Done"