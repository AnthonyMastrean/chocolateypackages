$name    = "underscore-compiled"
$startup = Join-Path $ENV:APPDATA "Microsoft\Windows\Start Menu\Programs\Startup"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$app     = Join-Path $tools "underscore.exe"
$icon    = Join-Path $tools "underscore_on.ico"
$target  = Join-Path $startup "underscore.lnk"

try {
  $shell = New-Object -ComObject "Wscript.Shell"
  $shortcut = $shell.CreateShortcut($target)
  $shortcut.TargetPath = $app
  $shortcut.WorkingDirectory = $tools
  $shortcut.IconLocation = $icon
  $shortcut.Save()

  & $target

  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  throw 
}