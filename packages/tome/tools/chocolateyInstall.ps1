$id = "tome"
$name = "Tales of Maj'Eyal"
$url = "http://te4.org/dl/t-engine/t-engine4-windows-1.2.5.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$tengine = Join-Path $content "t-engine4-windows-1.2.5\t-engine.exe"
$launcher = Join-Path $content "t-engine4-windows-1.2.5\t-engine-launcher.exe"
$spawn = Join-Path $content "t-engine4-windows-1.2.5\cef3spawn.exe"

. $tools\bins.ps1
. $tools\shortcut.ps1

Install-ChocolateyZipPackage $id $url $content

try {
  New-GuiBin -Name $tengine
  New-GuiBin -Name $launcher
  New-IgnoreBin -Name $spawn

  New-Shortcut -Link $name -Target $launcher -SpecialFolder "CommonDesktop"
  New-Shortcut -Link $name -Target $launcher -SpecialFolder "CommonPrograms"

  Write-ChocolateySuccess $id
} catch {
  Write-ChocolateyFailure $id $_.Exception.Message
  throw
}
