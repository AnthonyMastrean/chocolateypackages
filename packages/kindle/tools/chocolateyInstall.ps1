Install-ChocolateyPackage `
  -PackageName 'kindle' `
  -InstallerType 'EXE' `
  -SilentArgs '/S' `
  -Url 'https://s3.amazonaws.com/kindleforpc/57030/KindleForPC-installer-1.28.57030.exe' `
  -Checksum '6feea6ec44ff3d3b7be23e7a969fe14ab884a7b19e23bc2c74237730411559f6' `
  -ChecksumType 'SHA256'
