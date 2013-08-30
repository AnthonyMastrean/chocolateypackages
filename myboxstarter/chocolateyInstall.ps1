Update-ExecutionPolicy Unrestricted
Enable-RemoteDesktop

cinst binroot
cinst visualstudio2012premium
cinst start8
cinst modernmix
cinst all -source https://myget.org/F/fullblowndotnet

cinst Microsoft-Hyper-V-All -source windowsFeatures

Install-ChocolateyPinnedTaskBarItem "${ENV:PROGRAMFILES(X86)}\Google\Chrome\Application"
Install-ChocolateyPinnedTaskBarItem "$ENV:WINDIR\System32\WindowsPowerShell\v1.0\powershell.exe"
Install-ChocolateyPinnedTaskBarItem "$ENV:PROGRAMFILES\Notepad2\notepad2.exe"
Install-ChocolateyPinnedTaskBarItem "$ENV:WINDIR\System32\SnippingTool.exe"

Install-WindowsUpdates -AcceptEula
