function Invoke-GitClone($repository, $path) {
  Push-Location $path
  git clone $repository
  Pop-Location
}

Update-ExecutionPolicy Unrestricted
Install-WindowsUpdates -AcceptEula
Enable-RemoteDesktop

cinst binroot
cinst visualstudio2012premium
cinst start8
cinst modernmix
cinst all -source https://myget.org/F/fullblowndotnet

cinst Microsoft-Hyper-V-All -source windowsFeatures

Get-WindowsOptionalFeature -Online `
  | ?{ $_.FeatureName -match "IIS" } `
  | Enable-WindowsOptionalFeature -Online -All -NoRestart

$ps_profile_path = Join-Path $ENV:USERPROFILE "Documents\WindowsPowerShell"
$ps_modules_path = Join-Path $profile_path "Modules"

New-Item $ps_modules_path -Type Directory

Invoke-GitClone -repository git@github.com:AnthonyMastrean/WindowsPowerShell.git -path $ps_profile_path

@(
  "git@github.com:AnthonyMastrean/remember.git",
  "git@github.com:AnthonyMastrean/powertab.git",
  "git@github.com:dahlbyk/posh-git.git",
  "git@github.com:dahlbyk/posh-hg.git",
  "git@github.com:Iristyle/Posh-VsVars.git",
) | %{ Invoke-GitClone -repository $_ -path $ps_modules_path }

Install-ChocolateyPinnedTaskBarItem "${ENV:PROGRAMFILES(X86)}\Google\Chrome\Application"
Install-ChocolateyPinnedTaskBarItem "$ENV:WINDIR\System32\WindowsPowerShell\v1.0\powershell.exe"
Install-ChocolateyPinnedTaskBarItem "$ENV:PROGRAMFILES\Notepad2\notepad2.exe"
Install-ChocolateyPinnedTaskBarItem "$ENV:WINDIR\System32\SnippingTool.exe"
