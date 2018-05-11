$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$original = Join-Path $content 'shellcheck-v0.4.7.exe'
$target = Join-Path $content 'shellcheck.exe'

Install-ChocolateyZipPackage `
    -PackageName 'shellcheck' `
    -Url 'https://shellcheck.storage.googleapis.com/shellcheck-v0.4.7.zip' `
    -Checksum 'b3e8b4a36e074e1e824f06f459ecfde10b7f1e244e4948f59ad004c5ebaea890774b8bef50cc81c817c5c70b3b5efe13426eff099fb50a38e48571adc841cce5' `
    -ChecksumType 'SHA512' `
    -UnzipLocation $content

Rename-Item -Path $original -NewName $target -Force | Out-Null
