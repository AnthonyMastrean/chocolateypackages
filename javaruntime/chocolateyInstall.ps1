$name   = 'javaruntime'
$url    = 'http://javadl.sun.com/webapps/download/AutoDL?BundleId=64152'
$url64  = 'http://javadl.sun.com/webapps/download/AutoDL?BundleId=64153'
$type   = 'EXE'
$silent = '/s'

$java = Join-Path $env:ProgramFiles 'Java\jre7'
$bin  = Join-Path $java 'bin'
$cmd  = @"
[Environment]::SetEnvironmentVariable('JAVA_HOME', "$java", 'Machine')
"@

try {	
	Install-ChocolateyPackage $name $type $silent $url
	Install-ChocolateyPackage $name $type $silent $url64
	
  Start-ChocolateyProcessAsAdmin $cmd
  Install-ChocolateyPath $bin 'Machine'
	
	Write-ChocolateySuccess $name
}
catch {
	Write-ChocolateyFailure $name $($_.Exception.Message)
	return
}