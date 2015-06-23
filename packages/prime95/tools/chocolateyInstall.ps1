$id    = 'prime95'
$name  = 'Prime95'
$url   = 'http://www.mersenne.org/ftp_root/gimps/p95v285.win32.zip'
$url64 = 'http://www.mersenne.org/ftp_root/gimps/p95v285.win64.zip'

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$prime   = Join-Path $content 'prime95.exe'

. $tools\bins.ps1
. $tools\shortcut.ps1

Install-ChocolateyZipPackage -PacakgeName $id -Url $url -Url64 $url64 -UnzipLocation $content

New-GuiBin -Path $prime

New-Shortcut -Link $name -Target $prime -SpecialFolder "CommonPrograms"
