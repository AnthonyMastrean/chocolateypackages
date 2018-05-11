$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyZipPackage `
    -PackageName 'op' `
    -Url 'https://cache.agilebits.com/dist/1P/op/pkg/v0.4.1/op_windows_386_v0.4.1.zip' `
    -Checksum '88C8D5B0E8149A6C204AECD31A4572BF69F55A5BDA9F9D36F377B017B3F3258D' `
    -ChecksumType 'SHA256' `
    -Url64 'https://cache.agilebits.com/dist/1P/op/pkg/v0.4.1/op_windows_amd64_v0.4.1.zip' `
    -Checksum64 '3A04B24EB5CAB7EF403B7E6283898E3CBAEC23AA1EEE78935E680725AAB08393' `
    -ChecksumType64 'SHA256' `
    -UnzipLocation $content
