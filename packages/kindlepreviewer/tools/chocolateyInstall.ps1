Install-ChocolateyPackage `
    -PackageName 'kindlepreviewer' `
    -Url 'https://s3.amazonaws.com/kindlepreviewer3/KindlePreviewerInstaller.exe' `
    -Checksum '66761F4B49535D10F4D0066631AD14ED7F7E729D0401492710944E9F34A84032' `
    -ChecksumType 'SHA256' `
    -FileType 'EXE' `
    -SilentArgs '/S'
