$id      = "ksp-demo"
$name    = "Kerbal Space Program (Demo)"
$url     = "http://kerbalspaceprogram.mediafire.com/file/nfptdtbj1zwcyi7/KSP_demo_win.zip"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$ksp     = Join-Path $content "KSP_win\KSP.exe"

. $tools\bins.ps1
. $tools\shortcut.ps1

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation $content

New-GuiBin -Path $ksp

New-Shortcut -Link $name -Target $ksp -SpecialFolder "CommonDesktop"
New-Shortcut -Link $name -Target $ksp -SpecialFolder "CommonPrograms"
