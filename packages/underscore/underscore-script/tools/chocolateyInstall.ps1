$name    = "underscore-script"
$startup = Join-Path $ENV:APPDATA "Microsoft\Windows\Start Menu\Programs\Startup"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$script  = Join-Path $content "underscore.ahk"
$icon    = Join-Path $content "underscore_on.ico"
$target  = Join-Path $startup "underscore.lnk"

try {
  $shell = New-Object -ComObject "Wscript.Shell"
  $shortcut = $shell.CreateShortcut($target)
  $shortcut.TargetPath = $script  
  $shortcut.WorkingDirectory = $content
  $shortcut.IconLocation = $icon
  $shortcut.Save()

  & $target

  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  throw 
}