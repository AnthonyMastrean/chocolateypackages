$id      = "spaceengine"
$url     = "https://content.wuala.com/contents/DDDuke/Latest/SE-0972-setup.exe"
$kind    = "EXE"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

. $tools\bins.ps1

$silent  = "/VERYSILENT /NORESTART /DIR='$content'"

Install-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent -Url $url

Get-ChildItem *.exe -Recurse | New-IgnoreBin
