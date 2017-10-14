Install-ChocolateyPackage `
    -PackageName 'goggalaxy' `
    -Url 'https://cdn.gog.com/open/galaxy/client/setup_galaxy_1.2.24.93.exe' `
    -Checksum 'dbe52668308525a1a1bc3f838d888d38c1b759818a6df2f7bae8ba32aeb021c7' `
    -ChecksumType 'SHA256' `
    -FileType 'EXE' `
    -SilentArgs '/VERYSILENT /NORESTART'
