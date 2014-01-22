$name = "wudt"
$url  = "http://images2.store.microsoft.com/prod/clustera/framework/w7udt/1.0/en-us/Windows7-USB-DVD-tool.exe"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$archive = Join-Path $tools "wudt.exe"
$target  = Join-Path $tools "wudt.msi"

try { 
  # The URL is a self-extracting CAB. I have to manually unpack it and 
  # run the MSI inside.
  Get-ChocolateyWebFile $name $archive $url
  & $archive /Q /T:"$tools" /C
  Install-ChocolateyInstallPackage $name "MSI" "/QN" $target

  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  throw 
}
