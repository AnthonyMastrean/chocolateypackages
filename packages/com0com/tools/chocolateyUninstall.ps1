Uninstall-ChocolateyPackage `
  -PackageName 'com0com' `
  -FileType 'EXE' `
  -Silent '/S' `
  -File (Get-UninstallRegistryKey -SoftwareName 'Null-modem emulator (com0com)').UninstallString
