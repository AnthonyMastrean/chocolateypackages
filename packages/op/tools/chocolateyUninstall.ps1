Uninstall-ChocolateyPackage `
  -PackageName '1passwordforwindows' `
  -FileType 'EXE' `
  -Silent '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' `
  -File (Get-UninstallRegistryKey -SoftwareName '1Password 6').UninstallString
