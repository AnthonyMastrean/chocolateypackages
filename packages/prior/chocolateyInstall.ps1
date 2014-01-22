$name   = 'priorterminal'
$url    = 'http://prior.com/downloadcentre/documents/software/PriorTerminalSetup%202.8.zip'
$kind   = 'MSI'
$silent = '/Q'

$tools = Split-Path $MyInvocation.MyCommand.Definition
$temp  = Join-Path $ENV:TEMP "chocolatey\$name"
$zip   = Join-Path $temp "$name.zip"
$msi   = Join-Path $temp 'PriorTerminalSetup.msi'

try {
  New-Item $temp -Type Directory -Force

  Get-ChocolateyWebFile $name $zip $url
  Get-ChocolateyUnzip $zip $temp
  Install-ChocolateyInstallPackage $name $kind $silent $msi

  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw 
}