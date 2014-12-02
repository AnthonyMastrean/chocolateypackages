$name = "ungit"
$version = "0.8.4"

try {
  npm install -g ungit@$version
  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  throw 
}
