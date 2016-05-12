Install-ChocolateyPackage `
    -PackageName 'kindlepreviewer' `
    -FileType 'EXE' `
    -Silent '/S' `
    -Url 'http://kindlepreviewer.s3.amazonaws.com/KindlePreviewerInstall.exe' `
    -Checksum '' `
    -ChecksumType 'SHA256'
