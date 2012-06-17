try 
{ 
    $name    = 'sikuli'
    $url     = 'http://launchpad.net/sikuli/sikuli-x/x1.0-rc3/+download/Sikuli-X-1.0rc3%20%28r905%29-win32.zip'
    $tools   = Split-Path -parent $MyInvocation.MyCommand.Definition
    $content = Join-Path (Split-Path $tools) 'content'
    $sikuli  = Join-Path $content 'Sikuli-X-1.0rc3 (r905)-win32\Sikuli-IDE'
    $86      = Join-Path $sikuli 'sikuli-ide.bat'
    $64      = Join-Path $sikuli 'sikuli-ide-w.bat'
    $icon    = Join-Path $sikuli 'ide-icon.ico'	
    
    Install-ChocolateyZipPackage $name $url $content

    $is64bit = (Get-WmiObject Win32_Processor).AddressWidth -eq 64
    $target  = if($is64bit) { $64 } else { $86 }
    $desktop = [Environment]::GetFolderPath("Desktop")
    $link    = Join-Path $desktop 'Sikuli IDE.lnk'
	
    $shell = New-Object -ComObject "Wscript.Shell"
    $shortcut = $shell.CreateShortcut($link)
    $shortcut.TargetPath = $target
    $shortcut.WorkingDirectory = $sikuli
    $shortcut.IconLocation = $icon
    $shortcut.Save()

    Write-ChocolateySuccess $name
} 
catch 
{
    Write-ChocolateyFailure $name "$($_.Exception.Message)"
    throw 
}