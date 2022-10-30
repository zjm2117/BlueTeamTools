$file = Get-Content "D:\Git\BlueTeamTools\DomainSpecificScripts\DisableUsers.ps1"
$fileToSecStr = $file | ConvertTo-SecureString -AsPlainText -Force
$enc = $fileToSecStr | ConvertFrom-SecureString
$enc | Out-File -FilePath "D:\Git\BlueTeamTools\DomainSpecificScripts\enc.txt"

$file = Get-Content "D:\Git\BlueTeamTools\DomainSpecificScripts\enc.txt"
$dec =  $file | ConvertTo-SecureString
foreach ($str in $dec) {
	$decFile += [System.Runtime.InteropServices.Marshal]::PtrToStringBSTR([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($str))
	$decFile += "`n"
}

<# Use this if you want a key file
$file = Get-Content "D:\Git\BlueTeamTools\DomainSpecificScripts\DisableUsers.ps1"

$EncryptionKeyBytes = New-Object Byte[] 32
[Security.Cryptography.RNGCryptoServiceProvider]::Create().GetBytes($EncryptionKeyBytes)

$fileToSecStr = $file | ConvertTo-SecureString -AsPlainText -Force
$enc = $fileToSecStr | ConvertFrom-SecureString -Key $EncryptionKeyBytes
$enc | Out-File -FilePath "D:\Git\BlueTeamTools\DomainSpecificScripts\enc.txt"
#>