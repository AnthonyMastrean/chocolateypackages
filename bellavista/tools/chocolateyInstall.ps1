function Create-Shortcut
{
    param
    (
        [Parameter(Mandatory = $true)]
        [string] $shortcutPath,
        
        [Parameter(Mandatory = $true)]
        [string] $targetPath,
        
        [string] $workingDirectory = (Split-Path $targetPath)
    )

    $shell = New-Object -ComObject 'Wscript.Shell'
    $shortcut                  = $shell.CreateShortcut($shortcutPath)
    $shortcut.TargetPath       = $targetPath  
    $shortcut.WorkingDirectory = $workingDirectory
    $shortcut.Save()
}

try 
{ 
    $name    = 'bellavista'
    $tools   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
    $content = Join-Path (Split-Path $tools) 'content'
    
    # --------------------------------------------------
    # Get the archive from the web
    # --------------------------------------------------
    
    $url  = 'http://www.zezula.net/download/bellavista_en.zip'
    Install-ChocolateyZipPackage $name $url $content

    # --------------------------------------------------
    # Move the correct executable to the content dir
    # --------------------------------------------------

    $processor = Get-WmiObject Win32_Processor
    $is64bit = $processor.AddressWidth -eq 64

    $86 = Join-Path $content 'Win32\BellaVista.exe'
    $64 = Join-Path $content 'x64\BellaVista.exe'

    $source = if($is64bit) { $64 } else { $86 }
    $target = Join-Path $content 'BellaVista.exe'

    Copy-Item $source $target
    
    Remove-Item "$content\Win32" -Force -Recurse
    Remove-Item "$content\x64"   -Force -Recurse

    # --------------------------------------------------
    # And create a shortcut in All Programs
    # --------------------------------------------------

    $programs     = "$ENV:APPDATA\Microsoft\Windows\Start Menu\Programs"
    $shortcutPath = Join-Path $programs 'BellaVista.lnk'

    Create-Shortcut $shortcutPath $target
    
    Write-ChocolateySuccess "$name"
} 
catch 
{
    Write-ChocolateyFailure "$name" "$($_.Exception.Message)"
    throw 
}