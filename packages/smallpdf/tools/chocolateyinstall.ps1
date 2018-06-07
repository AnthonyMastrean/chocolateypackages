Install-ChocolateyPackage `
    -packageName 'smallpdf' `
    -fileType 'EXE' `
    -url 'https://download.smallpdf.com/desktop/win32/Smallpdf-Installer.exe' `
    -checksum 'BEBBEC4019AFE9A8FBB1C83F716AD02DA0468C6A9D96914A819C6FE4BF1DCD1D' `
    -checksumType 'sha256' `
    -url64bit 'https://download.smallpdf.com/desktop/win/Smallpdf-Installer.exe' `
    -checksum64 '79C7FCED71CB5B9790D4EE113346FB8813E8B07BC0E57B1E55B088F39C05B22C' `
    -checksumType64 'sha256' `
    -silentArgs '--silent'
