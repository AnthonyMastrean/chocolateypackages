$id = "rsync"
$url = "https://www.itefix.net/dl/cwRsync_5.4.1_x86_Free.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$cw_home = Join-Path $content "cwRsync_5.4.1_x86_Free"

. $tools\bins.ps1

Install-ChocolateyZipPackage $id $url $content

try {
  Get-ChildItem $cw_home\*.exe | %{ New-IgnoreBin -Name $_.fullname }
  Install-ChocolateyPath $cw_home "Machine"

  Write-ChocolateySuccess $id
} catch {
  Write-ChocolateyFailure $id $_.Exception.Message
  throw
}
