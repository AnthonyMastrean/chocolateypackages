$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyZipPackage `
    -PackageName 'op' `
    -Url 'https://cache.agilebits.com/dist/1P/op/pkg/v0.5.5/op_windows_386_v0.5.5.zip' `
    -Checksum 'DCFB3376CE93D2C529C1C723A00E1FD1506CB30E9064B2998C3B3B505F7CFD73' `
    -ChecksumType 'SHA256' `
    -Url64 'https://cache.agilebits.com/dist/1P/op/pkg/v0.5.5/op_windows_amd64_v0.5.5.zip' `
    -Checksum64 '520C743040F9D989F1D441EE38135182E8AE8A8A8050BF8A496EB7689602E4B0' `
    -ChecksumType64 'SHA256' `
    -UnzipLocation $content
