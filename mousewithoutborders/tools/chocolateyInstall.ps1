$name   = 'mousewithoutborders'
$url    = 'https://www.yousendit.com/directDownload?phi_action=app/directDownload&fl=SWhZekZoZ1BsamNaQ1lONjJVYnVnVE9yZWt5UmdteDRsUjJuWENHRzVZbz0&experience=bas'
$type   = 'MSI'
$silent = '/quiet'

Install-ChocolateyPackage $name $type $silent $url
