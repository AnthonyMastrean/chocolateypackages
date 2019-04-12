Install-ChocolateyPackage `
  -PackageName 'kindle' `
  -InstallerType 'EXE' `
  -SilentArgs '/S' `
  -Url 'https://s3.amazonaws.com/kindleforpc/52064/KindleForPC-installer-1.25.52064.exe' `
  -Checksum '314678A0A3B867BF412936ADAA67C6AB6D41C961F359A46F99C3AFA591702EF7' `
  -ChecksumType 'SHA256'
