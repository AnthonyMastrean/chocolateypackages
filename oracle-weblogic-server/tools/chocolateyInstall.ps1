$name   = "oracle-weblogic-server"
$url    = "http://download.oracle.com/otn/nt/middleware/12c/wls/1212/wls1212_dev.zip"
$home   = Join-Path (Get-BinRoot) "wls12120"
$config = Join-Path $home "configure.cmd"

Install-ChocolateyZipPackage $name $url (Get-BinRoot)

try {
  Start-ChocolateyProcessAsAdmin @"
[Environment]::SetEnvironmentVariable("MW_HOME", $home, "Machine")
"@

  & $config -silent

  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  throw 
}
