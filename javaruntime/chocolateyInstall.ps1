$name   = 'javaruntime'
$url    = 'http://javadl.sun.com/webapps/download/AutoDL?BundleId=64152'
$url64  = 'http://javadl.sun.com/webapps/download/AutoDL?BundleId=64153'
$type   = 'EXE'
$silent = '/s'
$java   = Join-Path $env:ProgramFiles 'Java\jre7'
$bin    = Join-Path $java 'bin'
	
try {	
  Install-ChocolateyPackage $name $type $silent $url
	
  $is64bit = (Get-WmiObject Win32_Processor).AddressWidth -eq 64
  if($is64bit) { 
    Install-ChocolateyPackage $name $type $silent $url64
  }
	
  Install-ChocolateyPath $bin 'Machine'
  Start-ChocolateyProcessAsAdmin @"
[Environment]::SetEnvironmentVariable('JAVA_HOME', "$java", 'Machine')
"@
	
  Write-ChocolateySuccess $name
}
catch {
	Write-ChocolateyFailure $name $($_.Exception.Message)
	return
}