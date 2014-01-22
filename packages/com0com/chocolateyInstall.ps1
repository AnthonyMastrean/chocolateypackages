$name   = 'com0com'
$url    = 'http://downloads.sourceforge.net/project/com0com/com0com/3.0.0.0/com0com-3.0.0.0-i386-and-x64-unsigned.zip'
$kind   = 'EXE'
$silent = '/S'

$tools  = Split-Path $MyInvocation.MyCommand.Definition
$zip    = Join-Path $tools "$name.zip"
$dir    = Join-Path $tools 'com0com-3.0.0.0-i386-and-x64'
$exe    = Join-Path $dir  'setup.exe'

try {
  Get-ChocolateyWebFile $name $zip $url
  Get-ChocolateyUnzip $zip $tools
  Install-ChocolateyInstallPackage $name $kind $silent $exe
  
  Remove-Item $zip -Force -Recurse
  Remove-Item $dir -Force -Recurse

  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw 
}