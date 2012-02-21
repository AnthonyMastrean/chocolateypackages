try
{
	$name = 'javaruntime.x64'
	$url  = 'http://javadl.sun.com/webapps/download/AutoDL?BundleId=60338'
	
	Install-ChocolateyPackage $name 'EXE' '/QN /NORESTART' $url
	
	$java = Join-Path $env:ProgramFiles 'Java\jre6'
	$bin  = Join-Path $java 'bin'
    $cmd  = @"
[Environment]::SetEnvironmentVariable('JAVA_HOME', "$java", 'Machine')
"@
	
	Start-ChocolateyProcessAsAdmin $cmd
	Install-ChocolateyPath $bin 'Machine'
	
	Write-ChocolateySuccess $name
}
catch
{
	Write-ChocolateyFailure $name $($_.Exception.Message)
	return
}