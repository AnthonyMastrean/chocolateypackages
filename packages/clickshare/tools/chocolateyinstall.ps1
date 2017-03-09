$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$content = Join-Path $package 'content'
$msi = Join-Path $content 'ClickShare_Launcher_01_11_00_0004_Setup_Win.msi'

Install-ChocolateyZipPackage `
  -PackageName 'clickshare' `
  -Url 'https://www.barco.com/api/sitecore/TdeFiles/Download?FileNumber=R33050021&TdeType=3&MajorVersion=01&MinorVersion=011&PatchVersion=00&BuildVersion=004' `
  -Checksum '5CD965B16DB3E60D362EACC933A24FF608A106FDDDC3FB21B25268040FABC1AF' `
  -ChecksumType 'SHA256' `
  -UnzipLocation $content

Install-ChocolateyInstallPackage `
  -PackageName 'clickshare' `
  -FileType 'MSI' `
  -SilentArgs 'ACCEPT_EULA=YES /QN' `
  -File $msi
