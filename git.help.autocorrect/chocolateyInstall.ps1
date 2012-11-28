$name = 'git.help.autocorrect'

try { 
  cmd.exe /c 'git config --global help.autocorrect 1'
  
  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw 
}