$name  = 'enableremotedesktop'
$tools = Split-Path $MyInvocation.MyCommand.Definition
$ps1   = Join-Path $tools 'Enable-RemoteDesktop.ps1'

try {
  Start-ChocolateyProcessAsAdmin "& `'$ps1`' -LowSecurity"
  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw 
}