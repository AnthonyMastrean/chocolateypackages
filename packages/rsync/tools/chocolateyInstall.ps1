$id  = "rsync"
$url = "https://www.itefix.net/dl/cwRsync_5.4.1_x86_Free.zip"

$tools      = Split-Path $MyInvocation.MyCommand.Definition
$content    = Join-Path (Split-Path $tools) "content"
$rsync_home = Join-Path $content "cwRsync_5.4.1_x86_Free"
$shimgen    = Join-Path $ENV:chocolateyInstall "tools\shimgen.exe"

. $tools\bins.ps1

Install-ChocolateyZipPackage $id $url $content

# This package requires the RSYNC_HOME directory on the PATH and a HOME
# environment variable be available. I have provided reliable batch files that
# perform these functions.
Move-Item $tools\*.bat $rsync_home

# We have to tell Chocolatey to -ignore- the existing executables, because it"s
# built-in shim generator cannot satisfy these requirements.
Get-ChildItem $rsync_home\*.exe | New-IgnoreBin

# Finally, we create our own shims to the custom batch files.
Get-ChildItem $rsync_home\*.bat | %{
  $bat      = $_
  $basename = (Split-Path -Leaf $bat) -replace ".bat", ".exe"
  $exe      = Join-Path $ENV:chocolateyInstall "bin\$basename"

  & $shimgen --output="$exe" --path="$bat"
}
