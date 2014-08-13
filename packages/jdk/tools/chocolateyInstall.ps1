$name = "jdk"
$url32 = "http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-windows-i586.exe"
$url64 = "http://download.oracle.com/otn-pub/java/jdk/7u67-b01/jdk-7u67-windows-x64.exe"
$kind = "EXE"
$silent = "/s" 

$temp = Join-Path $ENV:TEMP "chocolatey\jdk\jdkInstaller.exe"
$java = Join-Path $ENV:PROGRAMFILES "Java\jdk1.7.0_45"
$bin = Join-Path $java "bin"

try {
  $url = @{$true=$url64;$false=$url32}[(Get-ProcessorBits 64)]

  Write-Host "Downloading file from $url"

  [System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }
  $client = New-Object "System.Net.WebClient"
  $client.Headers.Add("Cookie", "gpw_e24=http://www.oracle.com")
  $client.DownloadFile($url, $temp)
  
  Install-ChocolateyInstallPackage $name $kind $silent $temp
  # Install-ChocolateyPath $bin "Machine"
  # Install-ChocolateyEnvironmentVariable "JAVA_HOME" $java "Machine"
        
  Write-ChocolateySuccess $name
}
catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  return
}
