$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$original = Join-Path $content 'shellcheck-v0.5.0.exe'
$target = Join-Path $content 'shellcheck.exe'

Install-ChocolateyZipPackage `
    -PackageName 'shellcheck' `
    -Url 'https://shellcheck.storage.googleapis.com/shellcheck-v0.5.0.zip' `
    -Checksum '5e1cd46b052f5669a021cd308daacf1221fd314964ceb96fd494c806e7620eba86bc32dcf5e3b9959904b374cce809b90e43fbc4df7e0f6289adf42ea1956465' `
    -ChecksumType 'SHA512' `
    -UnzipLocation $content

Rename-Item -Path $original -NewName $target -Force | Out-Null
