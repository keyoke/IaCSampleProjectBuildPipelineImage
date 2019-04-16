$progressPreference = 'silentlyContinue' 
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install kubernetes-helm --confirm
Install-Script -Name install-kubectl -Scope CurrentUser -Force
./install-kubectl.ps1