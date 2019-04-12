Uninstall-ChocolateyPackage `
  -PackageName 'inssider-lite' `
  -FileType 'EXE' `
  -Silent '--uninstall -s' `
  -File ((Get-UninstallRegistryKey -SoftwareName 'inSSIDer').UninstallString -split '"')[1]
