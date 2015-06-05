$id      = "pwnadventure3"
$name    = "Pwn Adventure 3 - Pwnie Island"
$url     = "http://pwnadventure.com/PwnAdventure3_Launcher_Windows.zip"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$adventure = Join-Path $content "PwnAdventure3.exe"

. $tools\bins.ps1
. $tools\shortcut.ps1

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation $content

New-IgnoreBin -Path $adventure

New-Shortcut -Link $name -Target $adventure -SpecialFolder "CommonPrograms"
New-Shortcut -Link $name -Target $adventure -SpecialFolder "CommonDesktop"
