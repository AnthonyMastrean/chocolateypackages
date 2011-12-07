try 
{ 
    $name = 'adom'
    
    $tools   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
    $content = Join-Path (Split-Path $tools) 'content'

    # We should rename the file in the ZIP to a non version specific 'adom.exe'
    Install-ChocolateyZipPackage "$name" 'http://www.adom.de/adom/download/windows/111/adom_winbeta4.zip' "$content"
    Move-Item "$content\adom_winbeta4.exe" "$content\adom.exe" -Force
    
    # ADOM writes an 'ADOM_DAT' directory in the current directory at startup
    # and as part of save game system. We need to modify the batch file to 
    # push the 'content' directory, with the ADOM executable and after the 
    # command, return to the normal directory.
    
    $bat = "$ENV:CHOCOLATEYINSTALL\bin\adom.bat"
    $strings = Get-Content $bat
    
@"
$strings[0]
pushd "$content"
$strings[1]
popd
"@ | Out-File $bat -Encoding ASCII
    
    Write-ChocolateySuccess "$name"
} 
catch 
{
    Write-ChocolateyFailure "$name" "$($_.Exception.Message)"
    throw 
}