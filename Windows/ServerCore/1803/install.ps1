$progressPreference = 'silentlyContinue' 
# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install helm
choco install kubernetes-helm --confirm

# Install kubectl
# Install-Script -Name install-kubectl -Scope CurrentUser -Force
c:\windows\temp\install-kubectl.ps1 -Downloadlocation "$($env:ProgramFiles)\kubectl\"
$env:Path += ";$($env:ProgramFiles)\kubectl\" 

# Install aks-engine
$version = "v0.34.1"
$archivename = "aks-engine-$version-windows-amd64"
Invoke-WebRequest -Uri "https://github.com/Azure/aks-engine/releases/download/$version/$archivename.zip" -OutFile "c:\windows\temp\$archivename.zip"
Expand-Archive -LiteralPath "c:\windows\temp\$archivename.zip" -DestinationPath "c:\windows\temp\" -Force
Move-Item -Path "c:\windows\temp\$archivename" -Destination "$($env:ProgramFiles)\aks-engine" -Force
$env:Path += ";$($env:ProgramFiles)\aks-engine\"