$url = 'http://download.microsoft.com/download/f/d/0/fd05def7-68a1-4f71-8546-25c359cc0842/UtilityOnlineMarch092009_03.exe'
$checksum = 'D5D9DC1ABF15342F95437DC1899ED5475E6561A9064C7FF405D0D74E528E20D3'
$checksumType = 'SHA256'

$tools = Split-Path -Parent $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

$archive = Join-Path $content 'UTILIT~1.EXE'

$utility32 = Join-Path $content 'UtilityOnlineMarch09\32-bit'
$utility64 = Join-Path $content 'UtilityOnlineMarch09\64-bit'
$utility = @{32=$utility32;64=$utility64}[(Get-ProcessorBits)]

$setup32 = Join-Path $utility32 'setup.exe'
$setup64 = Join-Path $utility64 'setup.exe'

$wmencoder32 = Join-Path $utility32 'WMEncoder.exe'
$wmendocer64 = Join-Path $utility64 'WMEncoder64.exe'
$wmencoder = @{32=$wmencoder32;64=$wmendocer64}[(Get-ProcessorBits)]

$msi = Join-Path $utility 'ScreenRecorder.msi'

New-Item -Type 'Directory' -Path $content -Force | Out-Null

Install-ChocolateyPackage `
  -PackageName 'screenrecorder' `
  -Url $url `
  -Url64 $url `
  -Checksum $checksum `
  -Checksum64 $checksum `
  -ChecksumType $checksumType `
  -ChecksumType64 $checksumType `
  -FileType 'EXE' `
  -SilentArgs "/Q /C /T:$content"

Get-ChocolateyUnzip `
  -FileFullPath $archive `
  -Destination $content

Install-ChocolateyInstallPackage `
  -PackageName 'windowsmediaencoder' `
  -FileType 'EXE' `
  -SilentArgs '/Q' `
  -File $wmencoder

Install-ChocolateyInstallPackage `
  -PackageName 'screenrecorder' `
  -FileType 'MSI' `
  -SilentArgs '/QN' `
  -File $msi

New-Item -Type 'File' -Path "$archive.ignore" -Force | Out-Null
New-Item -Type 'File' -Path "$wmencoder32.ignore" -Force | Out-Null
New-Item -Type 'File' -Path "$wmendocer64.ignore" -Force | Out-Null
New-Item -Type 'File' -Path "$setup32.ignore" -Force | Out-Null
New-Item -Type 'File' -Path "$setup64.ignore" -Force | Out-Null
