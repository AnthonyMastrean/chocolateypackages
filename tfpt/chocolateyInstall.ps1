$name   = 'tfpt'
$url    = 'http://visualstudiogallery.msdn.microsoft.com/b1ef7eb2-e084-4cb8-9bc7-06c3bad9148f/file/83775/3/Visual%20Studio%20Team%20Foundation%20Server%202012%20Update%202%20Power%20Tools.msi'
$silent = '/Q ADDLOCAL=ALL'
$kind   = 'MSI'

Install-ChocolateyPackage $name $kind $silent $url
