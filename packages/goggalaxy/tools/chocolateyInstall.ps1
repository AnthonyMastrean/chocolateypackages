Install-ChocolateyPackage `
    -PackageName 'goggalaxy' `
    -Url 'https://cdn.gog.com/open/galaxy/client/setup_galaxy_1.1.30.5.exe' `
    -Checksum '2422D2FF3AC93CE04824D7E6DF988E8DB2407DEADCEC698AB627C854E0F2EA08' `
    -ChecksumType 'SHA256' `
    -FileType 'EXE' `
    -SilentArgs '/VERYSILENT /NORESTART'
