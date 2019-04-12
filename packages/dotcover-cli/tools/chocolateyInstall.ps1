$tools = Split-Path -Path $MyInvocation.MyCommand.Definition
$content = Join-Path -Path (Split-Path -Path $tools) -ChildPath 'content'
$target = Join-Path -Path $content -ChildPath 'dotCover.exe'

Install-ChocolateyZipPackage `
    -PackageName 'dotcover-cli' `
    -Url 'https://download.jetbrains.com/resharper/ReSharperUltimate.2018.3.4/JetBrains.dotCover.CommandLineTools.2018.3.4.zip' `
    -Checksum 'a0fb72a6aa70202a8720932c0eb0719fcded488664733184b3ca3d145160b44a' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Get-ChildItem -Path $content -Include '*.exe' -Exclude 'dotCover.exe' -Recurse `
    | %{ New-Item -Type 'File' -Path "$_.ignore" | Out-Null }
