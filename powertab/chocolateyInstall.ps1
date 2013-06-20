$name   = 'powertab'
$url    = 'http://powertab.codeplex.com/downloads/get/159925'
$target = Join-Path $ENV:COMMONPROGRAMFILES 'Modules'

Install-ChocolateyZipPackage $name $url $target

try {
  if(-not($ENV:PSMODULEPATH.Contains($target))) {
    [System.Environment]::SetEnvironmentVariable('PSMODULEPATH', "$target;" + $ENV:PSMODULEPATH)
  }
  
  Write-ChocolateySuccess $name
} catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw
}
