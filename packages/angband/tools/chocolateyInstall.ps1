$id = "angband"
$name = "Angband"
$url = "http://rephial.org/downloads/3.5/angband-v3.5.1-win.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$angband = Join-Path $content "angband-3.5.1\angband.exe"

. $tools\bins.ps1
. $tools\shortcut.ps1

Install-ChocolateyZipPackage $id $url $content

try {
  New-GuiBin -Name $angband
  New-Shortcut -Link $name -Target $angband -SpecialFolder "CommonPrograms"

  Write-ChocolateySuccess $id
} catch {
  Write-ChocolateyFailure $id $_.Exception.Message
  throw
}
