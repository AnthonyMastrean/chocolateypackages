Install-ChocolateyPackage `
    -PackageName 'goggalaxy' `
    -Url 'https://cdn.gog.com/open/galaxy/client/setup_galaxy_1.1.27.1.exe' `
    -Checksum 'B83C218CD7C8785872018AE2AB93BA3A3CDAFB70FA97254B0A961C69252BA63E' `
    -ChecksumType 'SHA256' `
    -FileType 'EXE' `
    -SilentArgs '/VERYSILENT /NORESTART'
