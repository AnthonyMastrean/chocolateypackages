$name   = "ag"
$url    = "https://kjkpub.s3.amazonaws.com/software/the_silver_searcher/rel/0.18.1-1129/ag.exe"
$tools  = Split-Path $MyInvocation.MyCommand.Definition
$target = Join-Path $tools "ag.exe"

try {
  Get-ChocolateyWebFile $name $target $url
  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  throw 
}
