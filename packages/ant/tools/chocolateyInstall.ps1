$id = "ant"
$url = "http://archive.apache.org/dist/ant/binaries/apache-ant-1.9.4-bin.zip"
$root = Join-Path (Get-BinRoot) "apache-ant-1.9.4"
$bin = Join-Path $root "bin"

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation (Get-BinRoot)

try {
  Install-ChocolateyPath -PathToInstall $bin -PathType "Machine"
  Install-ChocolateyEnvironmentVariable -VariableType "Machine" -VariableName "ANT_HOME" -VariableValue $root
  Install-ChocolateyEnvironmentVariable -VariableType "Machine" -VariableName "ANT_OPTS" -VariableValue "-Xms256M -Xmx512M"
  
  Write-ChocolateySuccess $id
} catch {
  Write-ChocolateyFailure $id $_.Exception.Message
  throw
}
