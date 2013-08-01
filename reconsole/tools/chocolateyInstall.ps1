$name    = 'reconsole'
$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
    
try 
{    
    $startup      = "$ENV:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
    $shortcutPath = Join-Path $startup 'reconsole.lnk'

    $shell = New-Object -ComObject 'Wscript.Shell'
    $shortcut = $shell.CreateShortcut($shortcutPath)
    $shortcut.WorkingDirectory = $content
    $shortcut.TargetPath = Join-Path $content 'reconsole.ahk'
    $shortcut.IconLocation = Join-Path $content 'reconsole.ico'
    $shortcut.Save()
  
    & $shortcutPath
  
    Write-ChocolateySuccess $name
} 
catch 
{
    Write-ChocolateyFailure $name $($_.Exception.Message)
    throw 
}