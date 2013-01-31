$name   = 'resharper-nuget-61'
$url    = 'http://download.jetbrains.com/resharper/plugins/resharper-nuget.1.2.zip'

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$zip     = Join-Path $tools 'package.zip'
$content = Join-Path (Split-Path $tools) 'content'
$target  = Join-Path $content 'Install-NuGetSupport.6.1.bat'

try {
    Get-ChocolateyWebFile $name $zip $url
    Get-ChocolateyUnzip $zip $content

    . .\$target

    # Runs processes asserting UAC, will assert administrative rights - used by Install-ChocolateyInstallPackage
    #Run-ChocolateyProcessAsAdmin 'STATEMENTS_TO_RUN' 'Optional_Application_If_Not_PowerShell'

    Write-ChocolateySuccess $name
} 
catch {
    Write-ChocolateyFailure $name $($_.Exception.Message)
    throw 
}
