$id      = "pwnadventure2"
$name    = "Choose Your Pwn Adventure 2"
$url     = "http://ghostintheshellcode.com/2014-final/pwnadventure2_windows.zip"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$adventure = Join-Path $content "PwnAdventure2.exe"

. $tools\bins.ps1
. $tools\shortcut.ps1

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation $content

New-IgnoreBin -Path $adventure

New-Shortcut -Link $name -Target $adventure -SpecialFolder "CommonPrograms"
New-Shortcut -Link $name -Target $adventure -SpecialFolder "CommonDesktop"
