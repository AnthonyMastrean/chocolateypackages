Uninstall-ChocolateyPackage `
  -PackageName 'parsec' `
  -FileType 'EXE' `
  -Silent '' `
  -File (Get-UninstallRegistryKey -SoftwareName 'Parsec').UninstallString
