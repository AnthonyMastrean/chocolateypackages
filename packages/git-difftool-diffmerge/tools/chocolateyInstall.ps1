$name = "git.difftool.diffmerge"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$bat   = Join-Path $tools "gitconfig.bat"
$diff  = Join-Path $tools "diffmerge-diff.sh"
$merge = Join-Path $tools "diffmerge-merge.sh"

try { 
  & $bat $diff $merge
  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw 
}