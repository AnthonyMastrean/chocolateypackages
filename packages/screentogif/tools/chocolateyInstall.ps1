$id   = "screentogif"
$url  = "http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=screentogif&DownloadId=1425263&FileTime=130672346330530000&Build=20959"
$link = "Screen to Gif"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$bin     = Join-Path $content "ScreenToGif 1.4.1.exe"

. $tools\shortcut.ps1

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation $content

New-Shortcut -Link $link -SpecialFolder "CommonPrograms" -Target $bin
