try 
{ 
  $name = 'git.difftool.diffmerge'

  $tools   = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
  $content = Join-Path (Split-Path $tools) 'content'
  
  $bat     = Join-Path $tools   'gitconfig.bat'
  $diff    = Join-Path $content 'diffmerge-diff.sh'
  $merge   = Join-Path $content 'diffmerge-merge.sh'

  cmd.exe /c "`"$bat`" $diff $merge"

  Write-ChocolateySuccess "$name"
} 
catch 
{
  Write-ChocolateyFailure "$name" "$($_.Exception.Message)"
  throw 
}