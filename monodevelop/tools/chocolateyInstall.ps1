$name = 'monodevelop'
$url  = 'http://download.xamarin.com/monodevelop/Windows/MonoDevelop-2.8.5.msi'

Install-ChocolateyPackage $name 'MSI' '/quiet' $url