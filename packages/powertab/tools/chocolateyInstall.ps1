$name   = 'powertab'
$url    = 'http://powertab.codeplex.com/downloads/get/159925'
$target = Join-Path $ENV:COMMONPROGRAMFILES 'Modules'

try {
  # never works in chocolatey, but works in a manual admin prompt :(
  Start-ChocolateyProcessAsAdmin "New-Item $target -Type Directory -Force"
  
  Install-ChocolateyZipPackage $name $url $target

  if(-not($ENV:PSMODULEPATH.Contains($target))) {
    [System.Environment]::SetEnvironmentVariable('PSMODULEPATH', "$target;" + $ENV:PSMODULEPATH)
  }
  
  Write-ChocolateySuccess $name
} catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw
}
