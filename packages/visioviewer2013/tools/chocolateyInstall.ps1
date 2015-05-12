$id     = "visioviewer2013"
$url    = "http://download.microsoft.com/download/A/6/8/A682A83B-4866-4F88-AE83-61388629A891/visioviewer32bit.exe"
$url64  = "http://download.microsoft.com/download/A/6/8/A682A83B-4866-4F88-AE83-61388629A891/visioviewer64bit.exe"
$kind   = "EXE"
$silent = "/quiet /passive /norestart"

Install-ChocolateyPackage -PackageName $id -FileType $kind -Silent $silent -Url $url -Url64 $url64

