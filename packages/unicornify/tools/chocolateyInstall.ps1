$name = "unicornify"
$url = "https://bitbucket.org/balpha/go-unicornify/downloads/go-unicornify.exe"
$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$target = Join-Path $content "unicornify.exe"

try {
  New-Item $content -Type Directory -Force
  Get-ChocolateyWebFile $name $target $url
  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  throw 
}
