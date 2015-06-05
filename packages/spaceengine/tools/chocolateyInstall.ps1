$id      = "spaceengine"
$name    = "Space Engine"
$url     = "https://content.wuala.com/contents/DDDuke/Latest/SE-0972-setup.exe"
$kind    = "EXE"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

$programs = @{32=$ENV:PROGRAMFILES;64=${ENV:PROGRAMFILES(X86)}}[(Get-ProcessorBits)]
$dir     = Join-Path $programs "SpaceEngine"

$silent  = "/DIR=`"$dir`" /VERYSILENT /NORESTART"

Install-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent -Url $url
