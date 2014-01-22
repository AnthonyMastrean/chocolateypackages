try 
{ 
    $name = 'unfreez'
    
    $tools   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
    $content = Join-Path (Split-Path $tools) 'content'
    
    Install-ChocolateyZipPackage "$name" 'http://www.whitsoftdev.com/files/unfreez.zip' "$content"
    
    Write-ChocolateySuccess "$name"
} 
catch 
{
    Write-ChocolateyFailure "$name" "$($_.Exception.Message)"
    throw 
}