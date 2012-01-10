try 
{ 
    $name    = 'sikuli'
    $url     = 'http://launchpad.net/sikuli/sikuli-x/x1.0-rc3/+download/Sikuli-X-1.0rc3%20%28r905%29-win32.zip'
    $tools   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
    $content = Join-Path (Split-Path $tools) '$content'
    $86      = Join-Path $content 'sikuli-ide.bat'
    $64      = Join-Path $content 'sikuli-ide-w.bat'
    
    Install-ChocolateyZipPackage $name $url $content

    $is64bit = (Get-WmiObject Win32_Processor).AddressWidth -eq 64
    $target  = if($is64bit) { $64 } else { $86 }

	Install-ChocolateyDesktopLink $target

    Write-ChocolateySuccess $name
} 
catch 
{
    Write-ChocolateyFailure $name "$($_.Exception.Message)"
    throw 
}