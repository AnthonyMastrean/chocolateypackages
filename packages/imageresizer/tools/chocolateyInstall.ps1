Install-ChocolateyPackage `
    -PackageName 'imageresizerapp' `
    -FileType 'EXE' `
    -SilentArgs '/quiet /norestart' `
    -Url 'https://github.com/bricelam/ImageResizer/releases/download/v3.0/ImageResizerSetup-3.0.exe' `
    -Checksum '9E23E07E042943E1862B86D8C9DC05483A118938F5B19F359CB8F9AA6A14A452' `
    -ChecksumType 'SHA256'
