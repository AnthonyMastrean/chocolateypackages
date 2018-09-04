Uninstall-ChocolateyPackage `
  -PackageName '1passwordforwindows' `
  -FileType 'EXE' `
  -Silent '/VERYSILENT' `
  -File (Get-UninstallRegistryKey -SoftwareName '1Password').UninstallString
