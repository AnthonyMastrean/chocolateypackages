$name  = "oracle-instantclient-sqlplus"
$url   = "http://download.oracle.com/otn/nt/instantclient/11204/instantclient-sqlplus-nt-11.2.0.4.0.zip"
$url64 = "http://download.oracle.com/otn/nt/instantclient/11204/instantclient-sqlplus-windows.x64-11.2.0.4.0.zip"

Install-ChocolateyZipPackage -PackageName $name -Url $url -Url64Bit $url64 -UnzipLocation (Get-BinRoot)
