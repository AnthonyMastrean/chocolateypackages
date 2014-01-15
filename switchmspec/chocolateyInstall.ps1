$name  = 'mspec-version-switcher'
$tools = Split-Path $MyInvocation.MyCommand.Definition
$path  = Join-Path $tools 'Install-MSpec.ps1'

Install-ChocolateyPowershellCommand $name $path