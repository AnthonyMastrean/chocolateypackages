$id = "tome"
$url = "http://te4.org/do-download/tome-1.2.5/launcher-windows"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$launcher = Join-Path $content "t-engine-launcher.exe"

. $tools\bins.ps1

try {
  New-Item $content -Type "Directory" -Force | Out-Null

  Get-ChocolateyWebFile $id $launcher $url

  New-GuiBin -Name $launcher

  Write-ChocolateySuccess $id
} catch {
  Write-ChocolateyFailure $id $_.Exception.Message
  throw
}
