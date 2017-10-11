Uninstall-ChocolateyPackage `
  -PackageName 'strangeadventuresininfinitespace' `
  -FileType 'EXE' `
  -Silent '/VERYSILENT' `
  -File (Get-UninstallRegistryKey -SoftwareName 'Apache Directory Studio - (remove only)').UninstallString
