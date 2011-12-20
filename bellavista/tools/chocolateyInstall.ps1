function Create-Shortcut
{
  $shell = New-Object -ComObject 'Wscript.Shell'
  $shortcut = $shell.CreateShortcut($shortcutPath)
  $shortcut.TargetPath = $targetPath  
  $shortcut.WorkingDirectory = (Split-Path $targetPath)
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

    Move-Item $source $target
    
    Remove-Item "$content\Win32" -Force -Recurse
    Remove-Item "$content\x64"   -Force -Recurse

    # --------------------------------------------------
    # And create a shortcut in All Programs
    # --------------------------------------------------

    $allUsersPrograms = 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs'
    $shortcutPath     = Join-Path $allUsersPrograms 'BellaVista.lnk'
    $targetPath       = $target

    Create-Shortcut
    
    Write-ChocolateySuccess "$name"
} 
catch 
{
    Write-ChocolateyFailure "$name" "$($_.Exception.Message)"
    throw 
}