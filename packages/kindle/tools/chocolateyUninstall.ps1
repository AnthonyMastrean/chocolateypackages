Uninstall-ChocolateyPackage `
  -PackageName 'kindle' `
  -FileType 'EXE' `
  -SilentArgs '/S' `
  -File (Get-UninstallRegistryKey -SoftwareName 'Amazon Kindle').UninstallString
