$name = 'git.alias.standup'

try { 
  # Whoa, basically null-coalescing: $author = git config ?? env
  $author = if($author = cmd.exe /c "git config --global user.name") { 
    $author 
  } else { 
    $author = $ENV:USERNAME 
  }
  
  cmd.exe /c @"
git config --global alias.standup "log --since yesterday --oneline --author '$author'"
"@
  
  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw 
}