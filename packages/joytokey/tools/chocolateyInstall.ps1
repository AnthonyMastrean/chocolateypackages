$name = "joytokey"
$url = "http://joytokey.net/download/JoyToKey_en.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

$target = Join-Path $content "JoyToKey_en\JoyToKey.exe"
$gui = "$target.gui"

$startup = "$ENV:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
$link = Join-Path $startup "JoyToKey.lnk"

Install-ChocolateyZipPackage $name $url $content

try {
  New-Item $gui -Type File -Force

  $shell = New-Object -ComObject "Wscript.Shell"
  $shortcut = $shell.CreateShortcut($link)
  $shortcut.TargetPath = $target
  $shortcut.WorkingDirectory = $content
  $shortcut.Save()

  & $link

  Write-ChocolateySuccess $name
} catch {
  Write-ChocolateyFailure $name $_.Exception.Message
}
