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
    $name = 'testnamingmode'
 
    $startup      = "$ENV:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"

    $tools        = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
    $content      = Join-Path (Split-Path $tools) 'content'

    $targetPath   = Join-Path "$content" 'testnamingmode.ahk'
    $iconPath     = Join-Path "$content" 'testnamingmode_16.ico'
    $shortcutPath = Join-Path "$startup" 'testnamingmode.lnk'

    Create-Shortcut
    & $shortcutPath
  
    Write-ChocolateySuccess "$name"
} 
catch 
{
    Write-ChocolateyFailure "$name" "$($_.Exception.Message)"
    throw 
}