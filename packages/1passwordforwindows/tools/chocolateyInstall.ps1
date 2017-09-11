Install-ChocolateyPackage `
    -PackageName '1passwordforwindows' `
    -FileType 'EXE' `
    -SilentArgs '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' `
    -Url 'https://rink.hockeyapp.net/api/2/apps/0cb99692bcdb47abb89fad56dfd56d0c?format=zip' `
    -Checksum '642618F4CF52D811CAF6049F56C8DA4BB04AD36E858A597B7B635265689BE7ED' `
    -ChecksumType 'SHA256'
