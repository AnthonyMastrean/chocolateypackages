$name   = "monodevelop"
$url    = "http://download.xamarin.com/studio/Windows/XamarinStudio-4.0.8.msi"
$kind   = "MSI"
$silent = "/quiet"

Install-ChocolateyPackage $name $kind $silent $url
