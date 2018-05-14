$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$target = Join-Path $content 'ISORecorderV3.msi'

Install-ChocolateyZipPackage `
    -PackageName 'isorecorder' `
    -Url 'http://isorecorder.alexfeinman.com/static/ISORecorderV3RC1x86.zip' `
    -Checksum 'D4C5D259FB334E56ACF5BF04753F6904C1A782BFF17D2C2CAC50E503B5E61DC0' `
    -ChecksumType 'SHA256' `
    -Url64 'http://isorecorder.alexfeinman.com/static/ISORecorderV3RC1x64.zip' `
    -Checksum64 '20BCE41719774FCE7082819950B468DE068F41F88D1CC099C23BB012E92E42CF' `
    -ChecksumType64 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyInstallPackage `
    -PackageName 'isorecorder' `
    -FileType 'MSI' `
    -SilentArgs '/QN' `
    -File $target
