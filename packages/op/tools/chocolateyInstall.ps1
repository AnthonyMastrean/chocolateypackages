$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyZipPackage `
    -PackageName 'op' `
    -Url 'https://cache.agilebits.com/dist/1P/op/pkg/v0.1.1/op_windows_386_v0.1.1.zip' `
    -Checksum '49F4590D9344B938BD3519A9471591B8DEE1DBE6EEA83864969CFF7C0F1E9D43' `
    -ChecksumType 'SHA256' `
    -Url64 'https://cache.agilebits.com/dist/1P/op/pkg/v0.1.1/op_windows_amd64_v0.1.1.zip' `
    -Checksum64 '63F5026FB9FE2431050C7EF9D3AF178B8108D70D995DC0732A4184160B1DF946' `
    -ChecksumType64 'SHA256' `
    -UnzipLocation $content
