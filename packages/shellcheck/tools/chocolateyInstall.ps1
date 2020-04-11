$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$original = Join-Path $content 'shellcheck-v0.7.1.exe'
$target = Join-Path $content 'shellcheck.exe'

Install-ChocolateyZipPackage `
    -PackageName 'shellcheck' `
    -Url 'https://github.com/koalaman/shellcheck/releases/download/v0.7.1/shellcheck-v0.7.1.zip' `
    -Checksum '787163636e0e7bcd411c276cb6c0a2c849e3da5b27849c3b352a0622fb91944e6b986304855750d590f501044d56fa78279cbc4a4cbf0b1fc9981c54df708e4e' `
    -ChecksumType 'SHA512' `
    -UnzipLocation $content

Rename-Item -Path $original -NewName $target -Force | Out-Null
