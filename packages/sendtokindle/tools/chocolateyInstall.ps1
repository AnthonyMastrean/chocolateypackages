Set-Service `
    -Name 'Spooler' `
    -StartupType 'Automatic'

Install-ChocolateyPackage `
    -PackageName 'sendtokindle' `
    -FileType 'EXE' `
    -Silent '/S' `
    -Url 'http://s3.amazonaws.com/sendtokindle/SendToKindleForPC-installer.exe' `
    -Checksum '2A6F3D5F6E0477934177FE442D52861EDCE78086E3FDBBDA9FA19954C5391477' `
    -ChecksumType 'SHA256' `
    -ValidExitCodes @(0, 1223)
