$tools = Split-Path -Path $MyInvocation.MyCommand.Definition
$content = Join-Path -Path (Split-Path -Path $tools) -ChildPath 'content'

Install-ChocolateyZipPackage `
    -PackageName 'colortool' `
    -Url 'https://github.com/microsoft/Terminal/releases/download/1904.29002/ColorTool.zip' `
    -Checksum '2732E3E4E7BFDAA3230BAE7A9A43744E01E6F3C8C4A9627E52B14AD460F1C000' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content
