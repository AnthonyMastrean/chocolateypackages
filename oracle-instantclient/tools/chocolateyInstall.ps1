$name  = "oracle-instantclient"
$url   = "http://download.oracle.com/otn/nt/instantclient/11204/instantclient-basiclite-nt-11.2.0.4.0.zip"
$url64 = "http://download.oracle.com/otn/nt/instantclient/11204/instantclient-basiclite-windows.x64-11.2.0.4.0.zip"
$root  = Join-Path (Get-BinRoot) "instantclient_11_2"

Install-ChocolateyZipPackage -PackageName $name -Url $url -Url64Bit $url64 -UnzipLocation (Get-BinRoot)

try {
  Install-ChocolateyPath -PathToInstall $root -PathType "Machine"

  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  throw 
}
