$name  = "sublimetext3-contextmenu"
$tools = Split-Path $MyInvocation.MyCommand.Definition
$reg   = Join-Path $tools "sublimetext3-contextmenu.reg"

try {
  regedit /s $reg

  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  throw 
}
