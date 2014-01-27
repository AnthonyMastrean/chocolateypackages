$name   = "oracle-weblogic-server"
$url    = "http://download.oracle.com/otn/nt/middleware/12c/wls/1212/wls1212_dev.zip"
$login  = "https://login.oracle.com/mysso/signon.jsp"

$temp   = Join-Path $ENV:TEMP "chocolatey\oracle-weblogic-server\oracle-weblogic-server.zip"

$root   = Join-Path (Get-BinRoot) "wls12120"
$server = Join-Path $root "wlserver"
$config = Join-Path $root "configure.cmd"

try {
  Write-Host "Downloading file from $url"

  $post = New-Object System.Collections.Specialized.NameValueCollection
  $post.Add("sso_username", $username)
  $post.Add("ssopassword", $password)

  [System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }
  $client = New-Object System.Net.WebClient
  $client.Headers.Add("Cookie", "gpw_e24=http://www.oracle.com")
  $client.Headers.Add("Authorization", "Basic " + [System.Convert]::ToBase64String([System.Text.Encoding]::ASCII.GetBytes("${username}:${password}")))
  $client.Credentials = New-Object System.Net.NetworkCredential($username, $password)
  $client.UploadValues($login, "POST", $post)
  $client.DownloadFile($url, $temp)

  Get-ChocolateyUnzip -PackageName $name -FileFullPath $temp -Destination (Get-BinRoot)

  Start-ChocolateyProcessAsAdmin @"
[Environment]::SetEnvironmentVariable("MW_HOME", $root, "Machine")
[Environment]::SetEnvironmentVariable("WL_HOME", $server, "Machine")
"@

  & $config -silent

  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  throw 
}
