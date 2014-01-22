$name   = "oracle-weblogic-server"
$url    = "http://download.oracle.com/otn/nt/middleware/12c/wls/1212/wls1212_dev.zip"
$root   = Join-Path (Get-BinRoot) "wls12120"
$server = Join-Path $root "wlserver"
$config = Join-Path $root "configure.cmd"

Install-ChocolateyZipPackage $name $url (Get-BinRoot)

try {
  Start-ChocolateyProcessAsAdmin @"
[Environment]::SetEnvironmentVariable("MW_HOME", $root, "Machine")
[Environment]::SetEnvironmentVariable("WL_HOME", $server, "Machine")
"@

  & $config -silent

  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  throw 
}
