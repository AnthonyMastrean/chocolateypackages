$tools = Split-Path $MyInvocation.MyCommand.Path
$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyZipPackage `
    -PackageName 'mpress' `
    -Url 'https://web.archive.org/web/20150506065200/http://www.matcode.com/mpress.219.zip' `
    -Checksum '' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content
