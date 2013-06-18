$name   = 'treesize.free'
$url    = 'http://www.jam-software.com/treesize_free/TreeSizeFreeSetup.exe'
$silent = '/SILENT'

Install-ChocolateyPackage $name 'EXE' $silent $url
