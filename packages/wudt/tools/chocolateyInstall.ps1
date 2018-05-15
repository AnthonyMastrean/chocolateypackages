$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$install = Join-Path $content 'wudt.msi'

# The installer is not silent and doesn't respect it's own flags. It is,
# however, a self-extracting CAB. We can extract and install the MSI.
#
Install-ChocolateyZipPackage `
    -PackageName 'wudt' `
    -UnzipLocation $content `
    -Url 'https://download.microsoft.com/download/C/4/8/C48F6E20-FE20-41C6-8C1C-408FE7B49A3A/Windows7-USB-DVD-Download-Tool-Installer-en-US.exe' `
    -Checksum '6B7CEA4838D892A0A0F625BAB2DF3D378A035C365209DB3C573253F037882229' `
    -ChecksumType 'SHA256'

Install-ChocolateyInstallPackage `
    -PackageName 'wudt' `
    -FileType 'MSI' `
    -Silent '/QN' `
    -File $install
