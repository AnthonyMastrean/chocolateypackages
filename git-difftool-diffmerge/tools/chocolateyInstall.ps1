$name = "git.difftool.diffmerge"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

$diff    = Join-Path $content "diffmerge-diff.sh"
$merge   = Join-Path $content "diffmerge-merge.sh"

try { 
  git config --global diff.tool diffmerge
  git config --global difftool.diffmerge.cmd "`"`"$diff`" `"`$LOCAL`" `"`$REMOTE`"`""
  git config --global merge.tool diffmerge
  git config --global mergetool.diffmerge.cmd "`"`"$merge`" `"`$PWD/`$LOCAL`" `"`$PWD/`$BASE`" `"`$PWD/`$REMOTE`" `"`$PWD/`$MERGED`"`""
  git config --global mergetool.diffmerge.trustExitCode false
  git config --global mergetool.diffmerge.keepBackup false

  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw 
}