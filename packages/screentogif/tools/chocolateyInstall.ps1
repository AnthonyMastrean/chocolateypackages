$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$bin = Join-Path $content 'ScreenToGif 1.4.2.exe'

. $tools\shortcut.ps1

Install-ChocolateyZipPackage `
    -PackageName 'screentogif' `
    -Url 'http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=screentogif&DownloadId=1480830&FileTime=130851210516500000&Build=21031' `
    -Checksum 'd3e58ca0f0fd1824c761cae06400e964' `
    -UnzipLocation $content

Install-Shortcut `
    -Link 'Screen to Gif' `
    -Target $bin `
    -SpecialFolder 'CommonPrograms'
