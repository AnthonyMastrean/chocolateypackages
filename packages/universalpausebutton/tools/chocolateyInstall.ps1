$id   = "universalpausebutton"
$name = "Universal Pause Button"
$url  = "https://github.com/ryanries/UniversalPauseButton/releases/download/v1.0.3/UniversalPauseButton.zip"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$pause32 = Join-Path $content "UniversalPauseButton\UniversalPauseButton_x86.exe"
$pause64 = Join-Path $content "UniversalPauseButton\UniversalPauseButton_x64.exe"
$pause   = @{32=$pause32;64=$pause64}[(Get-ProcessorBits)]

. $tools\bins.ps1
. $tools\shortcut.ps1

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation $content

New-IgnoreBin -Path $pause32
New-IgnoreBin -Path $pause64

New-Shortcut -Link $name -Target $pause -SpecialFolder "CommonPrograms"
New-Shortcut -Link $name -Target $pause -SpecialFolder "CommonStartup"
