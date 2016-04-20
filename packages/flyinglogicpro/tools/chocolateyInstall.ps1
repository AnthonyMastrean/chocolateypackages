$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$install = Join-Path $content 'Flying Logic Pro Installer.exe'

. $tools\bins.ps1

Install-ChocolateyZipPackage `
    -PackageName 'flyinglogicpro' `
    -Url 'http://s3.amazonaws.com/flyinglogic.com/download/flying_logic_pro_win.zip' `
    -Url64 'http://s3.amazonaws.com/flyinglogic.com/download/flying_logic_pro_win_x64.zip' `
    -Checksum '1fc1ac4faa352d51d1e61a562e8a6da7' `
    -Checksum64 '208e7f4512ecc3441619951b6561c0fe' `
    -UnzipLocation $content

# This installer (install4j) does not respect unattended mode (-q), even with
# an explicit directory (-dir) and/or a response file (-varfile).
#
#   https://twitter.com/Wyrmkeep/status/611274375275266048
#
Install-ChocolateyInstallPackage `
    -PackageName 'flyinglogicpro' `
    -FileType 'EXE' `
    -Silent '-q' `
    -File $install

Install-IgnoreBin -Path $install
