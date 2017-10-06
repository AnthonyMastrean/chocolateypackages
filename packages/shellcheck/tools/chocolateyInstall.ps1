$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$original = Join-Path $content 'shellcheck-latest.exe'
$target = Join-Path $content 'shellcheck.exe'

Install-ChocolateyZipPackage `
    -PackageName 'shellcheck' `
    -Url 'https://shellcheck.storage.googleapis.com/shellcheck-latest.zip' `
    -Checksum 'c22305929dfa6a5b337341ec07c245d26a63f7c79533f2e86d217c1f7821793677cec2e28029b6082707781d817f6ee7a713ecf3c633d93ac691c0be528f80a7' `
    -ChecksumType 'SHA512' `
    -UnzipLocation $content

Rename-Item -Path $original -NewName $target -Force | Out-Null
