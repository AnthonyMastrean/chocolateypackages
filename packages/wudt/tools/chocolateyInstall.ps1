$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$msi = Join-Path $content 'wudt.msi'

. $tools\bins.ps1

# The installer is not silent and doesn't respect it's own flags. It is,
# however, a self-extracting CAB. We can extract and install the MSI.
#
Install-ChocolateyZipPackage `
    -PackageName 'wudt' `
    -UnzipLocation $content `
    -Url 'http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=wudt&DownloadId=96313&FileTime=129048694816630000&Build=21031' `
    -Checksum 'af911be206423bf440ea9d4df075a632'

Install-ChocolateyInstallPackage `
    -PackageName 'wudt' `
    -FileType 'MSI' `
    -Silent '/QN' `
    -File $msi
