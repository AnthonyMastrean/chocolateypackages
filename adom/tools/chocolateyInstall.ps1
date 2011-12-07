try 
{ 
    $name = 'adom'
    
    $tools   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
    $content = Join-Path (Split-Path $tools) 'content'

    # We should rename the file in the ZIP to a non version 
    # specific 'adom.exe'

    Install-ChocolateyZipPackage "$name" 'http://www.adom.de/adom/download/windows/111/adom_winbeta4.zip' "$content"
    Move-Item "$content\adom_winbeta4.exe" "$content\adom.exe" -Force
    
    # ADOM writes an 'ADOM_DAT' directory in the current 
    # directory at startup. We want that directory to be
    # in the 'content directory by default.

    $bat = "$ENV:CHOCOLATEYINSTALL\bin\adom.bat"
    
@"
@echo off
pushd "$content"
adom.exe %*
popd
"@ | Out-File $bat -Encoding ASCII
    
    <#
        There's a sneaky way around the permanent death 
        in ADOM. Copy your save files to a temp location
        and restore them when needed! Here's what an 
        adom.bat file would look like with save-scumming
        enabled.
        
        Usage:
        
            adom save (backup the save game)
            adom load (load a backup)
            adom      (play normally)
        
        ===================================================
    
        @echo off

        SET CONTENT="$content"

        if '%1'=='save' goto save
        if '%1'=='load' goto load

        pushd %CONTENT%
        adom.exe %*
        popd

        goto :eof

        :save
        mkdir "%CONTENT%\backup"
        copy "%CONTENT%\adom_dat\savedg" "%CONTENT%\backup"

        goto :eof

        :load
        copy "%CONTENT%\backup" "%CONTENT%\adom_dat\savedg"

        goto :eof
    #>
    
    Write-ChocolateySuccess "$name"
} 
catch 
{
    Write-ChocolateyFailure "$name" "$($_.Exception.Message)"
    throw 
}