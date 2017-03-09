$name32 = 'DameWare Mini Remote Control x86'
$name64 = 'DameWare Mini Remote Control x64'
$name = @{32=$name32;64=$name64}[(Get-ProcessorBits)]

Uninstall-ChocolateyPackage `
  -PackageName 'damewareminiremotecontrol' `
  -FileType 'EXE' `
  -File (Get-UninstallRegistryKey -SoftwareName $name).UninstallString
