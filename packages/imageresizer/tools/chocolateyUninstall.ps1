Uninstall-ChocolateyPackage `
  -PackageName 'imageresizerapp' `
  -FileType 'EXE' `
  -Silent '/quiet /norestart /uninstall' `
  -File (((Get-UninstallRegistryKey 'Image Resizer for Windows').UninstallString -split '"')[1])
