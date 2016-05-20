$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$msi = Join-Path $content 'PriorTerminalSetup.msi'
$exe = Join-Path $content 'setup.exe'

. $tools\bins.ps1

Install-ChocolateyZipPackage `
    -PackageName 'priorterminal' `
    -Url 'http://www.prior-us.com/files/PriorTerminalSetup_2.9.zip' `
    -Checksum '5CF0797936209EE61ADB52806AD23A245C97DAD3E5E5280C998BCE70AF92403E' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyInstallPackage `
    -PackageName 'priorterminal' `
    -FileType 'MSI' `
    -SilentArgs '/Q' `
    -File $msi

Install-IgnoreBin `
    -Path $exe
