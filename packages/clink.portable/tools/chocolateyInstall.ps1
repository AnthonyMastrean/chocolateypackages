$id = "clink.portable"
$url = "https://github.com/mridgers/clink/releases/download/0.4.3/clink_0.4.3.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

$installdir = Join-Path $content "clink_0.4.3"
$ignore32 = Join-Path $installdir "clink_x86.exe.ignore"
$ignore64 = Join-Path $installdir "clink_x64.exe.ignore"
$clink = Join-path $installdir "clink.bat"

Install-ChocolateyZipPackage $id $url $content

New-Item $ignore32 -Type "File" -Force
New-Item $ignore64 -Type "File" -Force

Generate-BinFile -Name "clink" -Path $clink
