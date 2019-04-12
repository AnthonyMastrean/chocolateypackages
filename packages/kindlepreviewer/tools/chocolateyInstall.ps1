Install-ChocolateyPackage `
    -PackageName 'kindlepreviewer' `
    -Url 'https://s3.amazonaws.com/kindlepreviewer3/KindlePreviewerInstaller.exe' `
    -Checksum 'E9C4654C52314F72C1CAB0A60871480BF40931B333B84C0D2A33FF544AF12AF4' `
    -ChecksumType 'SHA256' `
    -FileType 'EXE' `
    -SilentArgs '/S'
