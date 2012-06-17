$name   = 'mousewithoutborders'
$url    = 'https://www.yousendit.com/directDownload?phi_action=app/directDownload&fl=SWhZekZqMGM5RmJtcXV2RkN4RFFIVE9yZWt5UmdteDRsUjJuWENHRzVZbz0'
$type   = 'MSI'
$silent = '/quiet'

Install-ChocolateyPackage $name $type $silent $url