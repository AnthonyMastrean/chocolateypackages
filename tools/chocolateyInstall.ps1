$name   = 'intellitypepro.disableflock'

try {
    $tools  = Split-Path $MyInvocation.MyCommand.Definition
    $target = Join-Path $tools 'Disable-FunctionLock.ps1'

    Start-ChocolateyProcessAsAdmin "& `'$target`'"
    Write-ChocolateySuccess $name
} 
catch {
    Write-ChocolateyFailure $name $($_.Exception.Message)
    throw 
}
