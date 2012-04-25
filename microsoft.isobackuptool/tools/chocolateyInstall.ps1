<#
Liars, the /Q option does not work. This is a self-extracting CAB with an 
MSI inside of it. I'm going to have to unpack it manually. Damn.

---------------------------
Microsoft ISO Backup Tool
---------------------------
Command line options:

/Q -- Quiet modes for package,
/T:<full path> -- Specifies temporary working folder,
/C -- Extract files only to the folder when used also with /T.
/C:<Cmd> -- Override Install Command defined by author.

---------------------------
OK   
---------------------------
#>

try 
{ 
    $name = 'windows.usbdvdtool'
    $url  = 'http://images2.store.microsoft.com/prod/clustera/framework/w7udt/1.0/en-us/Windows7-USB-DVD-tool.exe'
    
    $tools   = Split-Path $MyInvocation.MyCommand.Definition
    $content = Join-Path (Split-Path $tools) 'content'
    $target  = Join-Path $content 'wudt.msi'
    
    Install-ChocolateyZipPackage $name $url $content
    Install-ChocolateyInstallPackage $name 'MSI' '/QUIET' $target

    Write-ChocolateySuccess $name
} 
catch 
{
    Write-ChocolateyFailure $name $($_.Exception.Message)
    throw 
}
