$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$install = Join-Path $content 'wudt.msi'

# The installer is not silent and doesn't respect it's own flags. It is,
# however, a self-extracting CAB. We can extract and install the MSI.
#
Install-ChocolateyZipPackage `
    -PackageName 'wudt' `
    -UnzipLocation $content `
    -Url 'http://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=wudt&DownloadId=96313&FileTime=129048694816630000&Build=21031' `
    -Checksum '6B7CEA4838D892A0A0F625BAB2DF3D378A035C365209DB3C573253F037882229' `
    -ChecksumType 'SHA256'

Install-ChocolateyInstallPackage `
    -PackageName 'wudt' `
    -FileType 'MSI' `
    -Silent '/QN' `
    -File $install
