Uninstall-ChocolateyPackage `
  -PackageName 'cheatengine' `
  -FileType 'EXE' `
  -Silent '/VERYSILENT /NORESTART' `
  -File (Get-UninstallRegistryKey -SoftwareName 'Cheat Engine 6.7').UninstallString.Trim('"')
