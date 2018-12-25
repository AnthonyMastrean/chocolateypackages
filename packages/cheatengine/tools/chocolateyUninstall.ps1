Uninstall-ChocolateyPackage `
  -PackageName 'cheatengine' `
  -FileType 'EXE' `
  -Silent '/VERYSILENT /NORESTART' `
  -File (Get-UninstallRegistryKey -SoftwareName "Cheat Engine $env:ChocolateyPackageVersion").UninstallString.Trim('"')
