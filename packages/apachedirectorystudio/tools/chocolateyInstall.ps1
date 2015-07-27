$id     = "apachedirectorystudio"
$name   = "Apache Directory Studio"
$url    = "http://psg.mtu.edu/pub/apache/directory/studio/2.0.0.v20150606-M9/ApacheDirectoryStudio-2.0.0.v20150606-M9-win32.win32.x86.zip"
$url64  = "http://psg.mtu.edu/pub/apache/directory/studio/2.0.0.v20150606-M9/ApacheDirectoryStudio-2.0.0.v20150606-M9-win32.win32.x86_64.zip"
$hash   = "51903e2a48e553d79772c7154830d254"
$hash64 = "0901e16f8c99821a89cb185367b80936"

$tools  = Split-Path $MyInvocation.MyCommand.Definition
$contents = Split-Path $tools
$bin    = Join-Path $contents (Join-Path "ApacheDirectoryStudio" "ApacheDirectoryStudio.exe")

. $tools\shortcut.ps1
. $tools\bins.ps1

Install-ChocolateyZipPackage -PackageName $id -UnzipLocation $contents -Url $url -Url64 $url64 -Checksum $hash -Checksum64 $hash64

New-Shortcut -Link $name -Target $bin -SpecialFolder "CommonPrograms"
New-IgnoreBin -Path $bin
