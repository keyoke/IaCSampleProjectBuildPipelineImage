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
Invoke-WebRequest -Uri "https://github.com/Azure/aks-engine/releases/download/v0.34.1/aks-engine-v0.34.1-windows-amd64.zip" -OutFile "c:\windows\temp\aks-engine-v0.34.1-windows-amd64.zip"
Expand-Archive -LiteralPath "c:\windows\temp\aks-engine-v0.34.1-windows-amd64.zip" -DestinationPath "$($env:ProgramFiles)\aks-engine\" -Force
$env:Path += ";$($env:ProgramFiles)\aks-engine\"