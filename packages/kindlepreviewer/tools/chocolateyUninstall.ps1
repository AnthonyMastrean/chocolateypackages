Uninstall-ChocolateyPackage `
    -PackageName 'kindlepreviewer' `
    -FileType 'EXE' `
    -Silent '/S' `
    -File (Get-UninstallRegistryKey -SoftwareName 'Kindle Previewer 3').UninstallString
