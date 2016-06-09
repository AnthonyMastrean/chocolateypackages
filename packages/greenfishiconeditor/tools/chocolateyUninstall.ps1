Uninstall-ChocolateyPackage `
    -PackageName 'greenfishiconeditor' `
    -FileType 'EXE' `
    -SilentArgs '/SILENT' `
    -File (Get-UninstallRegistryKey -SoftwareName 'Greenfish Icon Editor Pro 3.5').UninstallString.Trim('"')
