$tools = Split-Path -Path $MyInvocation.MyCommand.Definition
$content = Join-Path -Path (Split-Path -Path $tools) -ChildPath 'content'
$target = Join-Path -Path $content -ChildPath 'dotCover.exe'

Install-ChocolateyZipPackage `
    -PackageName 'dotcover-cli' `
    -Url 'https://download.jetbrains.com/resharper/JetBrains.dotCover.CommandLineTools.2018.1.zip' `
    -Checksum 'a0083de070f6af6a9730b1155a2e97b997de195965bf3a1cfe42b0bd3496c587' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Get-ChildItem -Path $content -Include '*.exe' -Exclude 'dotCover.exe' -Recurse `
    | %{ New-Item -Type 'File' -Path "$_.ignore" | Out-Null }
