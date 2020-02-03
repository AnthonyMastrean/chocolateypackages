$tools = Split-Path -Path $MyInvocation.MyCommand.Definition
$content = Join-Path -Path (Split-Path -Path $tools) -ChildPath 'content'

Install-ChocolateyZipPackage `
    -PackageName 'dotcover-cli' `
    -Url 'https://download.jetbrains.com/resharper/ReSharperUltimate.2019.3.1/JetBrains.dotCover.CommandLineTools.2019.3.1.zip' `
    -Checksum '52d748750cd270756da2e08e4bb587137ab0441a4037be481555f044b4c75834' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Get-ChildItem -Path $content -Include '*.exe' -Exclude 'dotCover.exe' -Recurse `
    | %{ New-Item -Type 'File' -Path "$_.ignore" | Out-Null }
