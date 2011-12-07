try 
{ 
    $name = 'adom'
    
    $tools   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
    $content = Join-Path (Split-Path $tools) 'content'

    Install-ChocolateyZipPackage "$name" 'http://www.adom.de/adom/download/windows/111/adom_winbeta4.zip' "$content"
        
    Move-Item "$content\adom_winbeta4.exe" "$content\adom.exe" -Force
    
    Write-ChocolateySuccess "$name"
} 
catch 
{
    Write-ChocolateyFailure "$name" "$($_.Exception.Message)"
    throw 
}