$id = "nethack"
$name = "NetHack for Windows"
$url = "http://sourceforge.net/projects/nethack/files/nethack/3.4.3/nethack-343-win.zip/download"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$classic = Join-Path $content "NetHack.exe"
$tiles = Join-Path $content "NetHackW.exe"

. $tools\bins.ps1
. $tools\shortcut.ps1

Install-ChocolateyZipPackage $id $url $content

try {
  New-GuiBin $tiles

  New-Shortcut -Link "$name (Tiles)" -Target $tiles -SpecialFolder "CommonPrograms"
  New-Shortcut -Link "$name (Classic)" -Target $classic -SpecialFolder "CommonPrograms"

  Write-ChocolateySuccess $id
} catch {
  Write-ChocolateyFailure $id $_.Exception.Message
  throw
}
