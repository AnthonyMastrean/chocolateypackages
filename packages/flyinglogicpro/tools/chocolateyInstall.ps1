$id     = "flyinglogicpro"
$url    = "http://s3.amazonaws.com/flyinglogic.com/download/flying_logic_pro_win.zip"
$url64  = "http://s3.amazonaws.com/flyinglogic.com/download/flying_logic_pro_win_x64.zip"
$kind   = "EXE"

# This installer does not respect unattended mode (-q), even with an explicit
# directory (-dir) and/or a response file (-varfile).
# https://twitter.com/Wyrmkeep/status/611274375275266048
$silent = "-q" # (install4j)

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$install = Join-Path $content "Flying Logic Pro Installer.exe"
$response = Join-Path $tools "response.varfile"
$folder  = Join-path $ENV:PROGRAMFILES "Flying Logic Pro"

. $tools\bins.ps1

Install-ChocolateyZipPackage -PackageName $id -Url $url -Url64 $url64 -UnzipLocation $content
Install-ChocolateyInstallPackage -PackageName $id -FileType $kind -Silent $silent -File $install

New-IgnoreBin -Path $install
