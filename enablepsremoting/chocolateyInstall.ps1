$name   = 'enablepsremoting'

try {
  Enable-PsRemoting -Force
  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw 
}