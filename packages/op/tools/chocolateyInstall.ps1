$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyZipPackage `
    -PackageName 'op' `
    -Url 'https://cache.agilebits.com/dist/1P/op/pkg/v0.5.4/op_windows_386_v0.5.4.zip' `
    -Checksum 'DF8582B76353F6194DE41EFC02B14D4B02EBACEC89339C88A28ECCBEA2E8A23F' `
    -ChecksumType 'SHA256' `
    -Url64 'https://cache.agilebits.com/dist/1P/op/pkg/v0.5.4/op_windows_amd64_v0.5.4.zip' `
    -Checksum64 '977A7F7308798D53024A620DC4F42448E53CC47277F4FAED2855285AA7F86F96' `
    -ChecksumType64 'SHA256' `
    -UnzipLocation $content
