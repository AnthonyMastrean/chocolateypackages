$name = "sikuli"
$url = "http://nightly.sikuli.de/sikulixsetup-1.1.0.jar"
$kind = "jar"
$silent = "options 1.1"

$tools = Split-Path -parent $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

$setup = Join-Path $content "sikulixsetup-1.1.0.jar"

try {
  New-Item $content -Type Directory -Force | Out-Null

  Get-ChocolateyWebFile $name $setup $url
  
  Push-Location $content
  Start-Process -Wait $setup $options
  Pop-Location

  Write-ChocolateySuccess $name
} catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  throw
}
