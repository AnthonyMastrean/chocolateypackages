$name   = 'ftprog'
$url    = 'http://www.ftdichip.com/Support/Utilities/FT_Prog%20v2.6.8.zip'

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

$zip = Join-Path $tools 'ftprog.zip'
$pkg = Join-Path $tools 'FT_Prog v2.6.8'
$gui = Join-Path $content 'FT_Prog.exe'
$cmd = Join-Path $content 'FT_Prog-CmdLine.exe'

$gui_name     = 'ftprogui'
$gui_filename = "$gui_name.exe"
$gui_path     = Join-Path $content $gui_filename
$ignore_path  = Join-Path $content "$gui_filename.gui"

$cmd_name     = 'ftprog'
$cmd_filename = "$cmd_name.exe"
$cmd_path     = Join-Path $content $cmd_filename

try {
  Get-ChocolateyWebFile $name $zip $url
  Get-ChocolateyUnzip $zip $tools
  
  Move-Item $pkg $content -Force
  Rename-Item $gui $gui_filename
  Rename-Item $cmd $cmd_filename
  New-Item $ignore_path -Type File
  Remove-Item $zip -Force -Recurse

  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw 
}