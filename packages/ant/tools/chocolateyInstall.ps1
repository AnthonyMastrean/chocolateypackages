$name = "ant"
$url  = "http://archive.apache.org/dist/ant/binaries/apache-ant-1.9.3-bin.zip"
$root = Join-Path (Get-BinRoot) "apache-ant-1.9.3"
$bin  = Join-Path $root "bin"

Install-ChocolateyZipPackage -PackageName $name -Url $url -UnzipLocation (Get-BinRoot)

try {
  Install-ChocolateyPath -PathToInstall $bin -PathType "Machine"
  Start-ChocolateyProcessAsAdmin -Minimized -Statements @"
[System.Environment]::SetEnvironmentVariable("ANT_HOME", $root, "Machine")
[System.Environment]::SetEnvironmentVariable("ANT_OPTS", "-Xms256M -Xmx512M", "Machine")
"@

  Write-ChocolateySuccess $name
} catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  throw
}
