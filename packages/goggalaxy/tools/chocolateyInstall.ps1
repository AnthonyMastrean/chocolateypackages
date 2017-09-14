Install-ChocolateyPackage `
    -PackageName 'goggalaxy' `
    -Url 'https://cdn.gog.com/open/galaxy/client/setup_galaxy_1.2.23.4.exe' `
    -Checksum '4D5BC6B515DA36C7B4E8A7F35F355C9D79EA2AF06A2043FC3445EA74784B063F' `
    -ChecksumType 'SHA256' `
    -FileType 'EXE' `
    -SilentArgs '/VERYSILENT /NORESTART'
