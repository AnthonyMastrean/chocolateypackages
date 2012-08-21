try 
{ 
    $name    = 'wim2vhd'
    $version = '6.1.7600.1'

    $is64bit = (Get-WmiObject Win32_Processor).AddressWidth -eq 64

    $tools   = Split-Path $MyInvocation.MyCommand.Definition
    $x86     = Join-Path $tools 'x86\imagex.exe'
    $x64     = Join-Path $tools 'x64\imagex.exe'
    $imagex  = if($is64bit) { $x64 } else { $x86 }
    
    $content = Join-Path (Split-Path $tools) 'content'
    
    $bat     = "$ENV:CHOCOLATEYINSTALL\bin\wim2vhd.bat"
    
    # Copy the architecture correct imagex.exe to the content directory
    Copy-Item $imagex $content
    
    # Remove the architecture staging areas
    Resolve-Path $tools\x* | Remove-Item -force -recurse
    
    # Write the custom bat file to the %chocolateyInstall% bin PATH
@"
@ECHO OFF
SET DIR=%~dp0
cscript "%DIR%..\lib\$name.$version\content\wim2vhd.wsf" %*
"@ | Out-File $bat -encoding ASCII
    
    Write-ChocolateySuccess $name
} 
catch 
{
    Write-ChocolateyFailure $name $($_.Exception.Message)
    throw 
}