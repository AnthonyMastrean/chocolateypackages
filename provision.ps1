Invoke-WebRequest -Uri 'http://chocolatey.org/install.ps1' -UseBasicParsing | Invoke-Expression

Import-Module -Name "$ENV:CHOCOLATEYINSTALL/helpers/chocolateyInstaller.psm1"
Update-SessionEnvironment
