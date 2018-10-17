$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyZipPackage `
    -PackageName 'colortool' `
    -Url 'https://github.com/Microsoft/console/releases/download/1810.02002/ColorTool.zip' `
    -Checksum 'FA3373D02B0835502BF0FA643EF3D7CF247B082357A33C6BCEEE07416371B672' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content
