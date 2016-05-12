$tools = Split-Path $MyInvocation.MyCommand.Path
$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyZipPackage `
    -PackageName 'mpress' `
    -Url 'https://web.archive.org/web/20150506065200/http://www.matcode.com/mpress.219.zip' `
    -Checksum '19FFEE93706DFF67F83D9EF48C0C794DEA761D4459B11C37F9BC65B04AF736C5' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content
