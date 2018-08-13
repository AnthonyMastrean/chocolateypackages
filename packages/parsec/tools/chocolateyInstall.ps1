Install-ChocolateyPackage `
    -PackageName 'parsec' `
    -Url 'https://s3.amazonaws.com/parsec-build/package/parsec-windows32.exe' `
    -Checksum '1EF14507AF49B87C01C740905B3E7F0FC08170C92E06DB5A6A5AF3B3F0496585' `
    -ChecksumType 'SHA256' `
    -Url64 'https://s3.amazonaws.com/parsec-build/package/parsec-windows.exe' `
    -Checksum64 '405A79D5827969A6ADF284D6C229E3E27C8BB1E0FD8F3C12F1DFED4029DD49F4' `
    -ChecksumType64 'SHA256' `
    -FileType 'EXE' `
    -SilentArgs ''
