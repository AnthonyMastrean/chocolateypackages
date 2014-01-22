$name  = "hp-hotkeysupport-off"
$tools = Split-Path $MyInvocation.MyCommand.Definition
$reg   = Join-Path $tools "hp-hotkeysupport-off.reg"

try {
  regedit /s $reg

  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  throw 
}
