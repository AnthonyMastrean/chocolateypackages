$id = "rsync"
$url = "https://www.itefix.net/dl/cwRsync_5.4.1_x86_Free.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$ssh = Join-Path $content "cwRsync_5.4.1_x86_Free\ssh.exe"
$keygen = Join-Path $content "cwRsync_5.4.1_x86_Free\ssh-keygen.exe"

. $tools\bins.ps1

Install-ChocolateyZipPackage $id $url $content

try {
  New-IgnoreBin -Name $ssh
  New-IgnoreBin -Name $keygen

  Write-ChocolateySuccess $id
} catch {
  Write-ChocolateyFailure $id $_.Exception.Message
  throw
}
