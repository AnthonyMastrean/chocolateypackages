$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyZipPackage `
    -PackageName 'isowriter' `
    -Url 'http://isorecorder.alexfeinman.com/static/ISOWriter.0.6.1.0.zip' `
    -Checksum '1983E9144BFF25571B9D4897F82406AC68B2A016B3458D4D7210DE014F18DA2B' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content
