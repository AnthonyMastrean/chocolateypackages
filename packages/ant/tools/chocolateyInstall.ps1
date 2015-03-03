$id = "ant"
$url = "http://archive.apache.org/dist/ant/binaries/apache-ant-1.9.4-bin.zip"
$ant_home = Join-Path (Get-BinRoot) "apache-ant-1.9.4"

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation (Get-BinRoot)

Write-Host "(Optional) Set your machine ANT_HOME and restart your shell:"
Write-Host "  PS> [System.Environment]::SetEnvironmentVariable('ANT_HOME', '$ant_home', 'Machine')"
