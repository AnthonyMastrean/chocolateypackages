Install-ChocolateyPackage `
    -PackageName '1passwordforwindows' `
    -FileType 'EXE' `
    -SilentArgs '/VERYSILENT' `
    -Url 'https://c.1password.com/dist/1P/win6/1PasswordSetup-7.2.576.exe' `
    -Checksum '4A85E971D5F2E88CA73F7030E08EA65C73A18FBB6A1AB148072F0D707EBA821D' `
    -ChecksumType 'SHA256'
