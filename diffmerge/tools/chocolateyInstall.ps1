$name   = 'diffmerge'
$url    = 'http://download-us.sourcegear.com/DiffMerge/3.3.2/DiffMerge_3.3.2.1139_x86.msi'
$url64  = 'http://download-us.sourcegear.com/DiffMerge/3.3.2/DiffMerge_3.3.2.1139_x64.msi'
$kind   = 'MSI'
$silent = '/quiet'

Install-ChocolateyPackage $name $kind $silent $url $url64
