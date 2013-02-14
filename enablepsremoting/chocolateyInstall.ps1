$name   = 'enablepsremoting'

try {
  Start-ChocolateyProcessAsAdmin "Enable-PsRemoting -Force"
  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw 
}