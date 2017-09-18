# The silent install flag, -nogui, cannot be used on first install, should
# figure out how to pass params to support -createaccount or -signinaccount
Install-ChocolateyPackage `
    -PackageName 'backblaze' `
    -Url 'https://secure.backblaze.com/win32/install_backblaze.exe' `
    -Checksum '0DEBB28546FB7666F76191922314E2F8B122FD2BCEC8AB4E8D37D07A6277E522' `
    -ChecksumType 'SHA256' `
    -FileType 'EXE' `
    -SilentArgs ''
