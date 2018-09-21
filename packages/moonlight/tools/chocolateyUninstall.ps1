Uninstall-ChocolateyPackage `
  -PackageName 'moonlight' `
  -FileType 'EXE' `
  -SilentArgs '/QUIET /NORESTART'
  -File (Get-UninstallRegistryKey -SoftwareName 'Moonlight Game Streaming Client').UninstallString
