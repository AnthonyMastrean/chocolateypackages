$name    = "wincommandpaste-script"
 
$startup = "$ENV:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

$target  = Join-Path $content "wincommandpaste.ahk"
$icon    = Join-Path $content "wincommandpaste.ico"
$link    = Join-Path $startup "wincommandpaste.lnk"


try {
	$shell = New-Object -ComObject "Wscript.Shell"
	$shortcut = $shell.CreateShortcut($link)
	$shortcut.TargetPath = $target  
	$shortcut.WorkingDirectory = $content
	$shortcut.IconLocation = $icon
	$shortcut.Save()
	
	& $link
  
  Write-ChocolateySuccess $name
} catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  throw 
}
