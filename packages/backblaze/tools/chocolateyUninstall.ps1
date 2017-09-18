Uninstall-ChocolateyPackage `
  -PackageName 'backblaze' `
  -FileType 'EXE' `
  -Silent '-nogui' `
  -File (Get-UninstallRegistryKey -SoftwareName 'Backblaze').UninstallString
