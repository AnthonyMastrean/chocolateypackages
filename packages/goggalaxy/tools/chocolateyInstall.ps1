Install-ChocolateyPackage `
    -PackageName 'goggalaxy' `
    -Url 'https://content-system.gog.com/open_link/download?path=/open/galaxy/client/setup_galaxy_1.2.32.20.exe' `
    -Checksum '4D87303F8941B5B41E625D7EE96320050B71698357B15C8A3D0630658A781F94' `
    -ChecksumType 'SHA256' `
    -FileType 'EXE' `
    -SilentArgs '/VERYSILENT /NORESTART'
