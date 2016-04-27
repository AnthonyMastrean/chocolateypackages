$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$content = Join-Path $package 'content'
$msi = Join-Path $content 'ClickShare_Launcher_01_09_00_0002_Setup_Win.msi'

Install-ChocolateyZipPackage `
  -PackageName 'clickshare' `
  -Url 'http://www.barco.com/api/sitecore/TdeFiles/Download?FileNumber=R33050021&TdeType=3&MajorVersion=01&MinorVersion=09&PatchVersion=00&BuildVersion=002' `
  -Checksum 'f7af82b61b5bce8692fe3af0273f39cd' `
  -UnzipLocation $content

Install-ChocolateyInstallPackage `
  -PackageName 'clickshare' `
  -FileType 'MSI' `
  -SilentArgs 'ACCEPT_EULA=YES /QN' `
  -File $msi
