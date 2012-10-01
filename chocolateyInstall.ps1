$name = 'git.alias.standup'

try { 
  $author = ''

  cmd.exe /c "git config --global alias.standup log --since yesterday --oneline --author '$author'"
  
  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw 
}