$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$original = Join-Path $content 'shellcheck-v0.6.0.exe'
$target = Join-Path $content 'shellcheck.exe'

Install-ChocolateyZipPackage `
    -PackageName 'shellcheck' `
    -Url 'https://shellcheck.storage.googleapis.com/shellcheck-v0.6.0.zip' `
    -Checksum '2d8171e79cafeeaefd1dc3be30cf44f8c3f2df0f18f6b54d4a028ab26c5159e07c9a1f0bc67603d1ae52bc2ba8d337df596079fec28bf1258255956bb552ce53' `
    -ChecksumType 'SHA512' `
    -UnzipLocation $content

Rename-Item -Path $original -NewName $target -Force | Out-Null
