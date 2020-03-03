$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyZipPackage `
    -PackageName 'op' `
    -Url 'https://cache.agilebits.com/dist/1P/op/pkg/v0.9.2/op_windows_386_v0.9.2.zip' `
    -Checksum 'B9083DC349B59F4D82EB138D6349B93739CC7F7882630D4A018D8E163D9CB457' `
    -ChecksumType 'SHA256' `
    -Url64 'https://cache.agilebits.com/dist/1P/op/pkg/v0.9.2/op_windows_amd64_v0.9.2.zip' `
    -Checksum64 'E6E326258DFE6421E8214C06E1FCCBF319708ABAD49AD42433B49E42A0634FEA' `
    -ChecksumType64 'SHA256' `
    -UnzipLocation $content
