$name = 'calibre'
$url  = 'http://downloads.sourceforge.net/project/calibre/0.8.32/calibre-0.8.32.msi?r=&ts=1324806483&use_mirror=voxel'

Install-ChocolateyPackage $name 'MSI' '/quiet' $url