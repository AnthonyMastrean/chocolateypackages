# This product uses a static download URL :'(
#
Install-ChocolateyPackage `
    -PackageName 'inssider-office' `
    -FileType 'MSI' `
    -SilentArgs '/QN' `
    -Url 'http://files.metageek.net/downloads/inSSIDerOffice.msi' `
    -Checksum 'EA7307CB9F0BA661411A3B4FBA3F3AE7FC3E8C41E00A82E587FD0C7F6AEE486E' `
    -ChecksumType 'SHA256'
