Uninstall-ChocolateyPackage `
    -packageName 'smallpdf' `
    -fileType 'EXE' `
    -silentArgs '--uninstall -s' `
    -file ((Get-UninstallRegistryKey -SoftwareName 'Smallpdf').UninstallString -split '"')[1]
