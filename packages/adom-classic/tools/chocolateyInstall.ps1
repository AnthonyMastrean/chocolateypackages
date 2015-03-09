$id = "adom-classic"
$name = "Ancient Domains of Mystery (ADOM)"
$url = "http://www.ancardia.com/download/adom_windows_1.2.0_pre23.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$adom = Join-Path $content "adom\Adom.exe"

. $tools\bins.ps1
. $tools\shortcut.ps1

Install-ChocolateyZipPackage $id $url $content

try {
  New-GuiBin -Name $adom
  New-Shortcut -Link $name -Target $adom -SpecialFolder "CommonPrograms"

  Write-ChocolateySuccess $id
} catch {
  Write-ChocolateyFailure $id $_.Exception.Message
  throw
}
