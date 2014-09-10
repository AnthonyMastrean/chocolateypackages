$id = "cloc"
$url = "http://downloads.sourceforge.net/project/cloc/cloc/v1.62/cloc-1.62.exe"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$target = Join-Path $content "cloc-1.62.exe"

try {
  New-Item $content -Type "Directory" -Force | Out-Null
  Get-ChocolateyWebFile $id $target $url

  Write-ChocolateySuccess $id
} catch {
  Write-ChocolateyFailure $id $_.Exception.Message
  throw
}
