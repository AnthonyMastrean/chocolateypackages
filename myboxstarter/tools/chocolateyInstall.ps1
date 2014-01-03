function Invoke-GitClone($url, $path = ".") {
  Push-Location $path
  git clone $url
  Pop-Location
}

Update-ExecutionPolicy -Policy Unrestricted
Enable-RemoteDesktop

# scoop!
Invoke-Expression (New-Object System.Net.WebClient).DownloadString("https://get.scoop.sh")
scoop install sudo
scoop install concfg

# apps
cinst 7zip
cinst ansicon
cinst dejavufonts
cinst dropbox
cinst f.lux
cinst git
cinst git-difftool-diffmerge
cinst googlechrome
cinst notepad2
cinst nuget.commandline
cinst nugetpackageexplorer
cinst reconsole
cinst ruby -x86
cinst ruby.devkit
cinst testnamingmode
cinst wincommandpaste

# fancy Windows features
cinst Microsoft-Hyper-V-All -source WindowsFeatures
cinst Microsoft-Hyper-V-Management-PowerShell -source WindowsFeatures
cinst IIS-WebServerRole -source Windowsfeatures

# no MSDN license here
cinst VisualStudio2012WDX
cinst VisualStudioExpress2012Web
cinst VisualStudioExpress2012Windows8
cinst IHateRegions
cinst IndentGuides
cinst NugetPackageManager
cinst PerfWatsonMonitor
cinst VSColorOutput

# clone my PowerShell profile and modules
$ps_profile_path = Split-Path $profile
$ps_modules_path = Join-Path $ps_profile_path "Modules"

New-Item $ps_modules_path -Type Directory -Force

Invoke-GitClone -url "git@github.com:AnthonyMastrean/WindowsPowerShell.git" -path $ps_profile_path

@( 
  "git@github.com:AnthonyMastrean/remember.git",
   "git@github.com:AnthonyMastrean/powertab.git",
   "git@github.com:AnthonyMastrean/chocolatey-dev.git",
   "git@github.com:dahlbyk/posh-git.git",
   "git@github.com:dahlbyk/posh-hg.git",
   "git@github.com:AnthonyMastrean/Posh-VsVars.git" 
 ) | %{ Invoke-GitClone -url $_ -path $ps_modules_path }

Install-ChocolateyPinnedTaskBarItem "${ENV:PROGRAMFILES(X86)}\Google\Chrome\Application"
Install-ChocolateyPinnedTaskBarItem "$ENV:WINDIR\System32\WindowsPowerShell\v1.0\powershell.exe"
Install-ChocolateyPinnedTaskBarItem "$ENV:PROGRAMFILES\Notepad2\notepad2.exe"
Install-ChocolateyPinnedTaskBarItem "$ENV:WINDIR\System32\SnippingTool.exe"

Install-WindowsUpdates -AcceptEula
