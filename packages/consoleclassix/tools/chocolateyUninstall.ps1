Uninstall-ChocolateyPackage `
  -PackageName 'consoleclassix' `
  -FileType 'EXE' `
  -Silent '/VERYSILENT' `
  -File (Get-UninstallRegistryKey -SoftwareName 'Console Classix version 4.30').UninstallString
