$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$original = Join-Path $content 'shellcheck-v0.7.0.exe'
$target = Join-Path $content 'shellcheck.exe'

Install-ChocolateyZipPackage `
    -PackageName 'shellcheck' `
    -Url 'https://shellcheck.storage.googleapis.com/shellcheck-v0.7.0.zip' `
    -Checksum '10ee2474845eeb76d8a13992457472b723edf470c7cf182a20b32ecee4ad009ec6b2ca542db8f66127cf19e24baf3a06838a0d101494a5a6c11b3b568f9f5a99' `
    -ChecksumType 'SHA512' `
    -UnzipLocation $content

Rename-Item -Path $original -NewName $target -Force | Out-Null
