Install-ChocolateyPackage `
    -PackageName '1passwordforwindows' `
    -FileType 'EXE' `
    -SilentArgs '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' `
    -Url 'https://rink.hockeyapp.net/api/2/apps/0cb99692bcdb47abb89fad56dfd56d0c?format=zip' `
    -Checksum '80C3F3A88A34A9966FCF27B3AA8EAFCFB50E575506D1D643BD1C297B178FD11B' `
    -ChecksumType 'SHA256'
