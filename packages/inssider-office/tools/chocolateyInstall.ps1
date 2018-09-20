# This product uses a static download URL :'(
#
Install-ChocolateyPackage `
    -PackageName 'inssider-office' `
    -FileType 'MSI' `
    -SilentArgs '/QN' `
    -Url 'http://files.metageek.net/downloads/inSSIDerOffice.msi' `
    -Checksum '95E647E5969169588DC6093AE26F19D194A22FDCC61DA54211106255FDA7ECE0' `
    -ChecksumType 'SHA256'
