$name    = "dulwich"
$url     = "https://github.com/jelmer/dulwich/archive/dulwich-0.9.0.zip"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$dulwich = Join-Path $content "dulwich-dulwich-0.9.0\dulwich"
$hg      = Join-Path $ENV:PROGRAMFILES "Mercurial\library.zip" 

Install-ChocolateyZipPackage $name $url $content

try {
  Start-ChocolateyProcessAsAdmin "7za u '$hg' '$dulwich'"
  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw 
}
