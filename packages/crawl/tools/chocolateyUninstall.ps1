Uninstall-ChocolateyPackage `
  -PackageName 'crawl' `
  -FileType 'EXE' `
  -Silent '/S' `
  -File (Get-UninstallRegistryKey -SoftwareName 'Dungeon Crawl Stone Soup').UninstallString
