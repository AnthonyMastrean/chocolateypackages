$id  = "rsync"
$url = "https://www.itefix.net/dl/cwRsync_5.4.1_x86_Free.zip"

$tools      = Split-Path $MyInvocation.MyCommand.Definition
$content    = Join-Path (Split-Path $tools) "content"
$rsync_home = Join-Path $content "cwRsync_5.4.1_x86_Free"
$shimgen    = Join-Path $ENV:chocolateyInstall "tools\shimgen.exe"

. $tools\bins.ps1

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation $content

# This package requires the RSYNC_HOME directory on the PATH and a HOME
# environment variable. This cannot be provided with Chocolatey's automatic
# shimming. I have to shim custom batch files.
Get-ChildItem $tools\*.bat | %{
  $bat      = $_
  $basename = (Split-Path -Leaf $bat) -replace ".bat", ".exe"
  $exe      = Join-Path $ENV:chocolateyInstall "bin\$basename"

  (Get-Content $bat -Raw) -replace '@rsync_home@', $rsync_home | Set-Content $bat

  & $shimgen --output="$exe" --path="$bat"
}

Get-ChildItem $rsync_home\*.exe | New-IgnoreBin
