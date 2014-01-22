$name    = "ungit"
$version = "0.1.9"

try {
  npm install -g ungit@$version
  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw 
}
