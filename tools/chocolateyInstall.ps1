$name   = 'intellitypepro.disableflock'

try {
    Run-ChocolateyProcessAsAdmin '.\Disable-FunctionLock.ps1'
    Write-ChocolateySuccess $name
} 
catch {
    Write-ChocolateyFailure $name $($_.Exception.Message)
    throw 
}
