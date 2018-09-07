Uninstall-ChocolateyPackage `
  -PackageName 'swordofmoonlight' `
  -FileType 'EXE' `
  -Silent '/VERYSILENT' `
  -File (Get-UninstallRegistryKey -SoftwareName 'Sword of Moonlight').UninstallString
