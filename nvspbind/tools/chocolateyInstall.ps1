try 
{ 
    $name = 'nvspbind'
    
    $tools   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
    $content = Join-Path (Split-Path $tools) 'content'
    
    $processor = Get-WmiObject Win32_Processor
    $is64bit = $processor.AddressWidth -eq 64
    
    if($is64bit)
    {
        $keep   = 'x64'
        $delete = 'x86'
    }
    else
    {
        $keep   = 'x86'
        $delete = 'x64'
    }
    
    Push-Location $content
    
    Remove-Item "nvspbind_$delete.exe" -Force
    Move-Item "nvspbind_$keep.exe" "nvspbind.exe"
    
    Pop-Location

    Write-ChocolateySuccess "$name"
} 
catch 
{
    Write-ChocolateyFailure "$name" "$($_.Exception.Message)"
    throw 
}