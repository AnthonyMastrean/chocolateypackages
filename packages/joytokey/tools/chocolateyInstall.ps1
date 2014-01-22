$name   = "joytokey"
$url    = "http://joytokey.net/download/JoyToKey_en.zip"
$tools  = Split-Path $MyInvocation.MyCommand.Definition
$gui    = Join-Path $tools "JoyToKey_en\JoyToKey.exe.gui"

Install-ChocolateyZipPackage $name $url $tools

try {
  New-Item $gui -Type File -Force
  Write-ChocolateySuccess $name
} catch {
  Write-ChocolateyFailure $name $_.Exception.Message
}