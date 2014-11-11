$id = "screentogif"
$url = "http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=screentogif&DownloadId=922737&FileTime=130583910278970000&Build=20941"
$url64 = ""
$kind = ""
$silent = ""

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

Install-ChocolateyZipPackage $id $url $content
