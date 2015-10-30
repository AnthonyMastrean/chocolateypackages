$tools   = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$content = Join-Path $package 'content'
$msi     = Join-Path $content 'ClickShare-Launcher-01_07_00_0069-Setup-Win.msi'

Install-ChocolateyZipPackage `
  -PackageName 'clickshare' `
  -Url 'http://www.barco.com/tde/(2211021901782421)/R33050021/001007000069/Barco_ApplicationSoftware_R33050021_v01.07.00.69__ClickShare-Launcher-Installer.zip' `
  -Checksum 'fda0e396b45c30c8c3f5ee84efa8b913' `
  -UnzipLocation $content

Install-ChocolateyInstallPackage `
  -PackageName 'clickshare' `
  -FileType 'MSI' `
  -SilentArgs 'ACCEPT_EULA=YES /QN' `
  -File $msi
