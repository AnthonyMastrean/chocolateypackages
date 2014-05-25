$name = "joytokey"
$url = "http://joytokey.net/download/JoyToKey_en.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$cotent = Join-Path (Split-Path $tools) "content"

$gui = Join-Path $content "JoyToKey_en\JoyToKey.exe.gui"

Install-ChocolateyZipPackage $name $url $content

try {
  New-Item $gui -Type File -Force
  Write-ChocolateySuccess $name
} catch {
  Write-ChocolateyFailure $name $_.Exception.Message
}
