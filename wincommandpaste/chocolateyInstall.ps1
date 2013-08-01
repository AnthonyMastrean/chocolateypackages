function Create-Shortcut
{
	$shell = New-Object -ComObject 'Wscript.Shell'
	$shortcut = $shell.CreateShortcut($shortcutPath)
	$shortcut.TargetPath = $targetPath  
	$shortcut.WorkingDirectory = $content
	$shortcut.IconLocation = $iconPath
	$shortcut.Save()
}

try 
{
    $name = 'wincommandpaste'
 
    $startup      = "$ENV:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"

    $tools        = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
    $content      = Join-Path (Split-Path $tools) 'content'

    $targetPath   = Join-Path "$content" 'wincommandpaste.ahk'
    $iconPath     = Join-Path "$content" 'wincommandpaste.ico'
    $shortcutPath = Join-Path "$startup" 'wincommandpaste.lnk'

    Create-Shortcut
    & $shortcutPath
  
    Write-ChocolateySuccess $name
} 
catch 
{
    Write-ChocolateyFailure $name "$($_.Exception.Message)"
    throw 
}