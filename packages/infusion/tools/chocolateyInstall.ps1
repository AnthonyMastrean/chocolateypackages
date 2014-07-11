$id = "infusion"
$url = "http://www.intooitus.com/download/file/fid/157"
$url64 = "http://www.intooitus.com/download/file/fid/158"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$infusion = Join-Path $content "inFusion"

$nogui = Join-Path $infusion "inFusion.exe.gui"
$ignorec = Join-Path $infusion "inFusionC.exe.ignore"
$ignoredebug = Join-Path $infusion "inFusionDebug.exe.ignore"

Install-ChocolateyZipPackage $id $url $content

New-Item $nogui -Type File -Force
New-Item $ignorec -Type File -Force
New-Item $ignoredebug -Type File -Force
