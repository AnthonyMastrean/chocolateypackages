Uninstall-ChocolateyPackage `
  -PackageName 'apachedirectorystudio' `
  -FileType 'EXE' `
  -Silent '/S' `
  -File (Get-UninstallRegistryKey -SoftwareName 'Apache Directory Studio - (remove only)').UninstallString
