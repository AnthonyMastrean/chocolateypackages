$name   = "jdk"
$url    = "http://download.oracle.com/otn-pub/java/jdk/7u45-b18/jdk-7u45-windows-i586.exe"
$url64  = "http://download.oracle.com/otn-pub/java/jdk/7u45-b18/jdk-7u45-windows-x64.exe"
$kind   = "EXE"
$silent = "/s" 

$temp   = Join-Path $ENV:TEMP "chocolatey\jdk\jdkInstaller.exe"

$java   = Join-Path $ENV:PROGRAMFILES "Java\jdk1.7.0_45"
$bin    = Join-Path $java "bin"

try {
  $dl = if(Get-ProcessorBits 64) { $url64 } else { $url }

  Write-Host "Downloading file from $dl"

  [System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }
  $client = New-Object "System.Net.WebClient"
  $client.Headers.Add("Cookie", "gpw_e24=http://www.oracle.com")
  $client.DownloadFile($dl, $temp)
  
  Install-ChocolateyInstallPackage $name $kind $silent $temp
  Install-ChocolateyPath $bin "Machine"
  Install-ChocolateyEnvironmentVariable "JAVA_HOME" $java "Machine"
        
  Write-ChocolateySuccess $name
}
catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  return
}
