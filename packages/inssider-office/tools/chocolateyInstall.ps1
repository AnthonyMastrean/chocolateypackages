Install-ChocolateyPackage `
    -PackageName 'inssider-office' `
    -FileType 'MSI' `
    -SilentArgs '/QN' `
    -Url 'http://files.metageek.net/downloads/inSSIDerOffice.msi' `
    -Checksum '772B772909B7070C531A8F07C375BE5126918039927AA37B64FC74C3E9B0F1E2' `
    -ChecksumType 'SHA256'
