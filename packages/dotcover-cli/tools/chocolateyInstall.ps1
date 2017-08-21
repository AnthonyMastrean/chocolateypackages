$tools = Split-Path -Path $MyInvocation.MyCommand.Definition
$content = Join-Path -Path (Split-Path -Path $tools) -ChildPath 'content'
$target = Join-Path -Path $content -ChildPath 'dotCover.exe'

Install-ChocolateyZipPackage `
    -PackageName 'dotcover-cli' `
    -Url 'https://download.jetbrains.com/resharper/JetBrains.dotCover.CommandLineTools.2017.1.20170613.162720.zip' `
    -Checksum 'E47E339FDE4C50360ABCF84257DAAFEDB71989207A8F8755EEE02567E0C60233' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Get-ChildItem -Path $content -Include '*.exe' -Exclude 'dotCover.exe' -Recurse `
    | %{ New-Item -Type 'File' -Path "$_.ignore" | Out-Null }
