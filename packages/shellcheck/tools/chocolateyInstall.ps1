$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$original = Join-Path $content 'shellcheck-v0.4.6.exe'
$target = Join-Path $content 'shellcheck.exe'

Install-ChocolateyZipPackage `
    -PackageName 'shellcheck' `
    -Url 'https://shellcheck.storage.googleapis.com/shellcheck-v0.4.6.zip' `
    -Checksum 'e806c117a99a32a7789d3972ca146f9b8915ef97e6b01bbfcd230af4fb8aa9459631bc11e7085d9476da790a471d4fe103465f89385853c3cb815ff6dfc95f46' `
    -ChecksumType 'SHA512' `
    -UnzipLocation $content

Rename-Item -Path $original -NewName $target -Force | Out-Null
