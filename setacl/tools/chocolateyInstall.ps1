try 
{ 
    $name = 'setacl'

    $tools        = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
    $content      = Join-Path (Split-Path $tools) 'content'
  
    Install-ChocolateyZipPackage "$name" 'http://downloads.sourceforge.net/project/setacl/SetACL%202.3.0.zip?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fsetacl%2Ffiles%2F&ts=1321923436&use_mirror=cdnetworks-us-2' "$content"

    $processor = Get-WmiObject Win32_Processor
    $is64bit = $processor.AddressWidth -eq 64
    
    # This package comes with both processor architectures, we need to identify the one we don't want and remove it.
    $bitness = if($is64bit) { "x86" } else { "x64" }
    $remove = "$content\SetACL 2.3.0\Command line version\$bitness"
    
    Remove-Item $remove -force -recurse
  
    Write-ChocolateySuccess "$name"
} 
catch 
{
    Write-ChocolateyFailure "$name" "$($_.Exception.Message)"
    throw 
}