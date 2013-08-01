$name = 'greenfishiconeditor'
$url  = 'http://download1us.softpedia.com/dl/a49cda0fc8844b55673f032f7e74356b/51faa8d4/100087102/software/multimedia/graphic/gfie_setup_3.31.exe'
$kind = 'EXE'
$silent = '/SILENT'

Install-ChocolateyPackage $name $kind $silent $url
