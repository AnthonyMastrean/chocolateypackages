$name = 'bellavista'
$url  = 'http://www.zezula.net/download/bellavista_en.zip'

$is64bit = (Get-WmiObject Win32_Processor).AddressWidth -eq 64

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

$32bit = Join-Path $content 'Win32\BellaVista.exe'
$64bit = Join-Path $content 'x64\BellaVista.exe'
$target = if($is64bit) { $64bit } else { $32bit }
$other = if($is64bit) { $32bit } else { $64bit }
$link = Join-Path $ENV:PROGRAMDATA 'Microsoft\Windows\Start Menu\Programs\BellaVista.lnk'

try { 
  Install-ChocolateyZipPackage $name $url $content

  # ignore the applications
  New-Item "$32bit.gui" -Force -Type 'File'
  New-Item "$64bit.gui" -Force -Type 'File'
  
  # we only want 1 batch file
  Remove-Item $other -Force -Recurse

  # and create the shortcut
  Start-ChocolateyProcessAsAdmin -minimized "
`$sh = New-Object -ComObject 'Wscript.Shell';
`$x = `$sh.CreateShortcut('$link');
`$x.TargetPath = '$target';
`$x.WorkingDirectory = (Split-Path '$target');
`$x.Save();
" 
  
  Write-ChocolateySuccess $name
} catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  throw 
}