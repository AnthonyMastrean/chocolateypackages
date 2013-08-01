$name    = 'wim2vhd'
$version = '6.1.7600.2'
    
try { 
    $tools   = Split-Path $MyInvocation.MyCommand.Definition
    $content = Join-Path (Split-Path $tools) 'content'
    $imagex32 = Join-Path $tools 'imagex.exe'
    $imagex64 = Join-Path $tools 'imagex64.exe'
        
    $is64bit = (Get-WmiObject Win32_Processor).AddressWidth -eq 64
    $imagex   = if($is64bit) { $imagex64 } else { $imagex32 }
    
    # Copy the architecture correct imagex to the content directory and 
    # get rid of the leftovers
    Copy-Item $imagex "$content\imagex.exe"
    Remove-Item "$tools\imagex*.exe" -force
    
    $bat = "$ENV:CHOCOLATEYINSTALL\bin\wim2vhd.bat"
    $wsf = "%DIR%..\lib\$name.$version\content\wim2vhd.wsf"
    
    # Write the custom bat file to the %chocolateyInstall% bin PATH
@"
@ECHO OFF
SET DIR=%~dp0
cscript "$wsf" %*
"@ | Out-File $bat -encoding 'ASCII'
    
    Write-ChocolateySuccess $name
} 
catch {
    Write-ChocolateyFailure $name $($_.Exception.Message)
    throw 
}