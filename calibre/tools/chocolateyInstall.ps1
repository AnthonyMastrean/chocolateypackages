# error handling is only necessary if you need to do anything 
# in addition to/instead of the main helpers
#try 
#{ 
    $name = 'calibre'
    
    # main helpers - these have error handling tucked into them 
    # so they become the only line of your script if that is all 
    # you need.

    # This command will assert administrative rights. Try any of 
    # these to get the silent EXE installer
    #
    #     /s /S /q /Q /quiet /silent /SILENT /VERYSILENT
    #
    # msi is always 
    #
    #	    /quiet
    # 
    Install-ChocolateyPackage "$name" 'EXE_OR_MSI' 'SILENT_ARGS' 'URL' '64BIT_URL_DELETE_IF_NO_64BIT' 

    # download and unpack a zip file
    Install-ChocolateyZipPackage "$name" 'URL' "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

    # other helpers - using any of these means you want to 
    # uncomment the error handling up top and at bottom.

    # downloader that the main helpers use to download items
    #Get-ChocolateyWebFile "$name" 'DOWNLOAD_TO_FILE_FULL_PATH' 'URL' '64BIT_URL_DELETE_IF_NO_64BIT'

    # installer, will assert administrative rights - used by Install-ChocolateyPackage
    #Install-ChocolateyInstallPackage "$name" 'EXE_OR_MSI' 'SILENT_ARGS' '_FULLFILEPATH_'

    # unzips a file to the specified location - auto overwrites existing content
    #Get-ChocolateyUnzip "FULL_LOCATION_TO_ZIP.zip" "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

    # Runs processes asserting UAC, will assert administrative rights - used by Install-ChocolateyInstallPackage
    #Run-ChocolateyProcessAsAdmin 'STATEMENTS_TO_RUN' 'Optional_Application_If_Not_PowerShell'

    # add specific folders to the path - any executables found in the chocolatey package folder will already be on the path. This is used in addition to that or for cases when a native installer doesn't add things to the path.
    #Install-ChocolateyPath 'LOCATION_TO_ADD_TO_PATH' 'User_OR_Machine' # Machine will assert administrative rights

    # add specific files as shortcuts to the desktop
    #$target = Join-Path $MyInvocation.MyCommand.Definition "$name.exe"
    #Install-ChocolateyDesktopLink $target

    #------- ADDITIONAL SETUP -------#
    # make sure to uncomment the error handling if you have additional setup to do

    #$processor = Get-WmiObject Win32_Processor
    #$is64bit = $processor.AddressWidth -eq 64

    # the following is all part of error handling
    #Write-ChocolateySuccess "$name"
#} 
#catch 
#{
    #Write-ChocolateyFailure "$name" "$($_.Exception.Message)"
    #throw 
#}
