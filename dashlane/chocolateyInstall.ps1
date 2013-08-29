$name   = "dashlane"
$url    = "https://d3qm0vl2sdkrc.cloudfront.net/alpha/Dashlane_Launcher-1375429898.exe"
$kind   = "EXE"
$silent = "/SILENT"

Install-ChocolateyPackage $name $kind $silent $url
