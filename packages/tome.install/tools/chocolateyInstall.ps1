$id = "tome"
$url = "http://te4.org/do-download/tome-1.2.5/launcher-windows"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$launcher = Join-Path $content "t-engine-launcher.exe"

. $tools\bins.ps1

try {
  New-Item $content -Type "Directory" -Force | Out-Null

  Get-ChocolateyWebFile $id $launcher $url

  New-GuiBin -Name $launcher

  Write-Host @"
The ToME launcher will now be displayed. Please do not change the default 
install directory or Chocolatey will be unable to manage uninstall.

You may exit and re-run the launcher from a console later

  > t-engine-launcher

But, after the first successful install/configuration, ToME will move the 
launcher to the install directory and this shortcut will no longer work! You 
will have to run ToME from the desktop or Start Menu shortcuts.
"@

  & $launcher

  Write-ChocolateySuccess $id
} catch {
  Write-ChocolateyFailure $id $_.Exception.Message
  throw
}
