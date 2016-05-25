Set-Service `
    -Name 'Spooler' `
    -StartupType 'Automatic'

Install-ChocolateyPackage `
    -PackageName 'sendtokindle' `
    -FileType 'EXE' `
    -Silent '/S' `
    -Url 'http://s3.amazonaws.com/sendtokindle/SendToKindleForPC-installer.exe' `
    -Checksum '42F3FD58D90EA6927F963D01B52BDAAC07946CE29F072730E11428FF18C5FA5A' `
    -ChecksumType 'SHA256' `
    -ValidExitCodes @(0, 1223)
