Uninstall-ChocolateyPackage `
  -PackageName 'goggalaxy' `
  -FileType 'EXE' `
  -Silent '/VERYSILENT /NORESTART' `
  -File (Get-UninstallRegistryKey -SoftwareName 'GOG Galaxy').UninstallString
