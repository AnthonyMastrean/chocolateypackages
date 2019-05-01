$tools = Split-Path -Path $MyInvocation.MyCommand.Definition
$content = Join-Path -Path (Split-Path -Path $tools) -ChildPath 'content'

Install-ChocolateyZipPackage `
    -PackageName 'dotcover-cli' `
    -Url 'https://download.jetbrains.com/resharper/ReSharperUltimate.2019.1/JetBrains.dotCover.CommandLineTools.2019.1.zip' `
    -Checksum 'baaba77ff70041b6ff2c2033ee8ef3e26661f76faaf4646c4c9317ce0525133a' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Get-ChildItem -Path $content -Include '*.exe' -Exclude 'dotCover.exe' -Recurse `
    | %{ New-Item -Type 'File' -Path "$_.ignore" | Out-Null }
