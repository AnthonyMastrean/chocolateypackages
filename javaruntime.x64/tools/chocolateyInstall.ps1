$name = 'javaruntime.x64'
$url  = 'http://javadl.sun.com/webapps/download/AutoDL?BundleId=58126'
Install-ChocolateyPackage $name 'EXE' '/QN /NORESTART' $url