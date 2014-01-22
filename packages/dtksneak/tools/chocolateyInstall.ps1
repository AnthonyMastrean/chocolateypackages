$name = 'autohotkey'

$startup      = "$ENV:APPDATA\Microsoft\Windows\Start Menu\Programs\Startup"

$tools        = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
$content      = Join-Path (Split-Path $tools) "content"

$targetPath   = Join-Path "$content" "dtk.ahk"
$iconPath     = Join-Path "$content" "dtk.ico"
$shortcutPath = Join-Path "$startup" "dtksneak.lnk"

try 
{ 
  #Runs processes asserting UAC, will assert administrative rights - used by Install-ChocolateyInstallPackage
  #Run-ChocolateyProcessAsAdmin 'STATEMENTS_TO_RUN' 'Optional_Application_If_Not_PowerShell'
  
  $shell = New-Object -ComObject "Wscript.Shell"
  $shortcut = $shell.CreateShortcut($shortcutPath)
  $shortcut.TargetPath = $targetPath  
  $shortcut.WorkingDirectory = $content
  $shortcut.IconLocation = $iconPath
  $shortcut.Save()
  
  & $shortcutPath
  
  Write-ChocolateySuccess "$name"
} 
catch 
{
  Write-ChocolateyFailure "$name" "$($_.Exception.Message)"
  throw 
}