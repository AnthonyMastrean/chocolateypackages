$name = 'javaruntime'
$url  = 'http://javadl.sun.com/webapps/download/AutoDL?BundleId=58124'
Install-ChocolateyPackage $name 'EXE' '/S' $url