$name   = 'tfpt'
$url    = 'http://visualstudiogallery.msdn.microsoft.com/c255a1e4-04ba-4f68-8f4e-cd473d6b971f/file/35473/4/tfpt.msi'
$silent = '/Q'
$kind   = 'MSI'

Install-ChocolateyPackage $name $kind $silent $url
