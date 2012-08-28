$name    = 'testnamingmode'
$startup = "$ENV:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"
$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

try {
    $script = Join-Path $content 'testnamingmode.ahk'
    $icon   = Join-Path $content 'testnamingmode.ico'
    $target = Join-Path $startup 'testnamingmode.lnk'

    $shell = New-Object -ComObject 'Wscript.Shell'
    $shortcut = $shell.CreateShortcut($target)
    $shortcut.TargetPath = $script  
    $shortcut.WorkingDirectory = $content
    $shortcut.IconLocation = $icon
    $shortcut.Save()
  
    & $target
  
    Write-ChocolateySuccess $name
} 
catch {
    Write-ChocolateyFailure $name $($_.Exception.Message)
    throw 
}