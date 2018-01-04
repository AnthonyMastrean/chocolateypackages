Set-Service `
    -Name 'Spooler' `
    -StartupType 'Automatic'

Install-ChocolateyPackage `
    -PackageName 'sendtokindle' `
    -FileType 'EXE' `
    -Silent '/S' `
    -Url 'http://s3.amazonaws.com/sendtokindle/SendToKindleForPC-installer.exe' `
    -Checksum 'C0968AFA80A719AC55CD8384C2E2C3E917AA0AC169AF7F594B308585465AD3B7' `
    -ChecksumType 'SHA256' `
    -ValidExitCodes @(0, 1223)
