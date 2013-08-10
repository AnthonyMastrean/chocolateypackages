$name   = '__NAME__'
$url    = '__URL__'
$url64  = '__URL64__'
$kind   = 'MSI'
$silent = '/Q'

$tools = Split-Path $MyInvocation.MyCommand.Definition
#$content = Join-Path (Split-Path $tools) 'content'

Install-ChocolateyPackage $name $kind $silent $url $url64
#Install-ChocolateyZipPackage $name $url $tools

#try {
  #$is64bit = (Get-WmiObject Win32_Processor).AddressWidth -eq 64
  
  #Get-ChocolateyWebFile $name 'DOWNLOAD_TO_FILE_FULL_PATH' $url $url64
  #Install-ChocolateyInstallPackage $name 'EXE_OR_MSI' $silent '_FULLFILEPATH_'
  #Get-ChocolateyUnzip "FULL_LOCATION_TO_ZIP.zip" $tools
  #Start-ChocolateyProcessAsAdmin 'STATEMENTS_TO_RUN' 'Optional_Application_If_Not_PowerShell'

  #Write-ChocolateySuccess $name
#} 
#catch {
  #Write-ChocolateyFailure $name $($_.Exception.Message)
  #throw 
#}
