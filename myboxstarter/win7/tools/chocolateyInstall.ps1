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

# clone my PowerShell profile and modules
Invoke-GitClone -url "git@github.com:AnthonyMastrean/WindowsPowerShell.git" -path [System.Environment]::GetFolderPath("MyDocuments")

@( 
  "git@github.com:AnthonyMastrean/remember.git",
   "git@github.com:AnthonyMastrean/powertab.git",
   "git@github.com:AnthonyMastrean/chocolatey-dev.git",
   "git@github.com:dahlbyk/posh-git.git",
   "git@github.com:dahlbyk/posh-hg.git"
 ) | %{ Invoke-GitClone -url $_ -path (Join-Path (Split-Path $profile) "Modules") }

Install-ChocolateyPinnedTaskBarItem "${ENV:PROGRAMFILES(X86)}\Google\Chrome\Application"
Install-ChocolateyPinnedTaskBarItem "$ENV:WINDIR\System32\WindowsPowerShell\v1.0\powershell.exe"
Install-ChocolateyPinnedTaskBarItem "$ENV:PROGRAMFILES\Notepad2\notepad2.exe"
Install-ChocolateyPinnedTaskBarItem "$ENV:WINDIR\System32\SnippingTool.exe"

Install-WindowsUpdates -AcceptEula
