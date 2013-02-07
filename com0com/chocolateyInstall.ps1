$name   = 'com0com'
$url    = 'http://downloads.sourceforge.net/project/com0com/com0com/3.0.0.0/com0com-3.0.0.0-i386-and-x64-unsigned.zip'
$kind   = 'EXE'
$silent = '/S'

$tools  = Split-Path $MyInvocation.MyCommand.Definition
$zip    = Join-Path $tools $zip
$exe    = Join-Path $tools 'setup.exe'

try {
  Get-ChocolateyWebFile $name $zip $url
  Get-ChocolateyUnzip $zip $tools
  Install-ChocolateyInstallPackage $name $kind $silent $exe

  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw 
}