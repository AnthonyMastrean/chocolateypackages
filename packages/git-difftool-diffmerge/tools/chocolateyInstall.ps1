$name  = "git-difftool-diffmerge"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$bat   = Join-Path $tools "git-difftool-diffmerge.bat"

try { 
  & $bat
  Write-ChocolateySuccess $name
} catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  throw 
}