Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
choco.exe install procmon -y
choco.exe install procexp -y
choco.exe install putty -y
choco.exe install git -y
choco.exe install wireshark -y
choco.exe install winpcap -y
cd "C:\"
mkdir "Python311"
cd "C:\Program Files\Git"
.\git-cmd.exe
git clone "https://github.com/zjm2117/BlueTeamTools" "C:\Python311"
exit