$id = "crawl"
$url = "http://sourceforge.net/projects/crawl-ref/files/Stone%20Soup/0.15.2/stone_soup-0.15.2-win32-installer.exe/download"
$kind = "EXE"
$silent = "/S"

Install-ChocolateyPackage $id $kind $silent $url
