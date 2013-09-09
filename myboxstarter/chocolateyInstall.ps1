Update-ExecutionPolicy Unrestricted
Install-WindowsUpdates -AcceptEula
Enable-RemoteDesktop

cinst binroot
cinst visualstudio2012premium
cinst start8
cinst modernmix
cinst all -source https://myget.org/F/fullblowndotnet

cinst Microsoft-Hyper-V-All -source windowsFeatures

$profile_path = Join-Path $ENV:USERPROFILE "Documents\WindowsPowerShell"
$modules_path = Join-Path $profile_path "Modules"

$modules = @(
  "git@github.com:AnthonyMastrean/remember.git",
  "git@github.com:AnthonyMastrean/powertab.git",
  "git@github.com:dahlbyk/posh-git.git",
  "git@github.com:dahlbyk/posh-hg.git",
  "git@github.com:Iristyle/Posh-VsVars.git",
)

git clone git@github.com:AnthonyMastrean/WindowsPowerShell.git $profile_path
New-Item $modules_path -Type Directory
Push-Location $modules_path
$modules | %{ git clone $_ }
Pop-Location

Install-ChocolateyPinnedTaskBarItem "${ENV:PROGRAMFILES(X86)}\Google\Chrome\Application"
Install-ChocolateyPinnedTaskBarItem "$ENV:WINDIR\System32\WindowsPowerShell\v1.0\powershell.exe"
Install-ChocolateyPinnedTaskBarItem "$ENV:PROGRAMFILES\Notepad2\notepad2.exe"
Install-ChocolateyPinnedTaskBarItem "$ENV:WINDIR\System32\SnippingTool.exe"
