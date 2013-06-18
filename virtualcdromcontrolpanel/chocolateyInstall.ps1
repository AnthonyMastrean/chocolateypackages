$name   = 'virtualcdromcontrolpanel'
$url    = 'http://download.microsoft.com/download/F/6/2/F6268E17-5F64-40B3-929B-D4400C46E4E7/winxpvirtualcdcontrolpanel_21.exe'

$tools = Split-Path $MyInvocation.MyCommand.Definition
$gui   = Join-Path $tools 'VCdControlTool.exe.gui'
$sys   = Join-Path $tools 'VCdRom.sys'

try {
  New-Item $gui -Type File -Force
  
  Install-ChocolateyZipPackage $name $url $tools
  
  Start-ChocolateyProcessAsAdmin @"
Copy-Item $sys (Join-Path $ENV:SYSTEMROOT (Join-Path 'system32' 'drivers')) -Force
"@

  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw 
}