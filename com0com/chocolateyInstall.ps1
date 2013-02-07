$name   = '__NAME__'
$url    = '__URL__'
$url64  = '__URL64__'
$silent = '/Q'

$tools = Split-Path $MyInvocation.MyCommand.Definition
#$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyPackage $name 'EXE_OR_MSI' $silent $url $url64
#Install-ChocolateyZipPackage $name $url $tools

#try {
  # downloader that the main helpers use to download items
  #Get-ChocolateyWebFile $name 'DOWNLOAD_TO_FILE_FULL_PATH' $url $url64

  # installer, will assert administrative rights - used by Install-ChocolateyPackage
  #Install-ChocolateyInstallPackage $name 'EXE_OR_MSI' $silent '_FULLFILEPATH_'

  # unzips a file to the specified location - auto overwrites existing content
  #Get-ChocolateyUnzip "FULL_LOCATION_TO_ZIP.zip" $tools

  # Runs processes asserting UAC, will assert administrative rights - used by Install-ChocolateyInstallPackage
  #Run-ChocolateyProcessAsAdmin 'STATEMENTS_TO_RUN' 'Optional_Application_If_Not_PowerShell'

  # add specific folders to the path - any executables found in the chocolatey package folder will already be on the path. This is used in addition to that or for cases when a native installer doesn't add things to the path.
  #Install-ChocolateyPath 'LOCATION_TO_ADD_TO_PATH' 'User_OR_Machine' # Machine will assert administrative rights

  # add specific files as shortcuts to the desktop
  #$target = Join-Path $MyInvocation.MyCommand.Definition "$name.exe"
  #Install-ChocolateyDesktopLink $target

  #$is64bit = (Get-WmiObject Win32_Processor).AddressWidth -eq 64

  #Write-ChocolateySuccess $name
#} 
#catch {
  #Write-ChocolateyFailure $name $($_.Exception.Message)
  #throw 
#}