Install-ChocolateyPackage `
    -PackageName 'goggalaxy' `
    -Url 'https://content-system.gog.com/open_link/download?path=/open/galaxy/client/setup_galaxy_1.2.46.172.exe' `
    -Checksum 'EDAE0A99386A56DADD858D08B97D6B2211F3361E498793BA44D573403BD1AFD0' `
    -ChecksumType 'SHA256' `
    -FileType 'EXE' `
    -SilentArgs '/VERYSILENT /NORESTART'
