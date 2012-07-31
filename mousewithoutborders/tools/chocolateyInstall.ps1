$name   = 'mousewithoutborders'
$url    = 'https://www.yousendit.com/directDownload?phi_action=app/directDownload&fl=SWhZekZoZ1BwaFM5TERkT1VqOE1Eak9yZWt5UmdteDRsUjJuWENHRzVZbz0&experience=bas'
$type   = 'MSI'
$silent = '/quiet'

Install-ChocolateyPackage $name $type $silent $url
