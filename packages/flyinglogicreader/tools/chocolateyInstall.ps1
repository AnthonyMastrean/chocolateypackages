$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$install = Join-Path $content 'Flying Logic Reader Installer.exe'

. $tools\bins.ps1

Install-ChocolateyZipPackage `
    -PackageName 'flyinglogicreader' `
    -Url 'http://s3.amazonaws.com/flyinglogic.com/download/flying_logic_reader_win.zip' `
    -Url64 'http://s3.amazonaws.com/flyinglogic.com/download/flying_logic_reader_win_x64.zip' `
    -Checksum 'd5e0e144a5790fd16e49859ec7ed1153' `
    -Checksum64 '74942e3b38918d6abb47c73e92faa17e' `
    -UnzipLocation $content

# This installer (install4j) does not respect unattended mode (-q), even with
# an explicit directory (-dir) and/or a response file (-varfile).
#
#   https://twitter.com/Wyrmkeep/status/611274375275266048
#
Install-ChocolateyInstallPackage `
    -PackageName 'flyinglogicreader' `
    -FileType 'EXE' `
    -Silent '-q' `
    -File $install

Install-IgnoreBin -Path $install
