$productcode32 = '{1235083F-52F9-44CC-9DF5-F9B7802BB9B7}'
$productcode64 = '{2D7ED2A0-9553-412B-939F-D6E0AEB2ABE1}'
$productcode = @{32=$productcode32;64=$productcode64}[(Get-ProcessorBits)]

Uninstall-ChocolateyPackage `
  -PackageName 'isorecorder' `
  -FileType 'MSI' `
  -Silent "$productcode /QN"
