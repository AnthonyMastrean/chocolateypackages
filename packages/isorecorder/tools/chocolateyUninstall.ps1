$productcode32 = '{39600969-41C3-4658-876E-16F108FC5C92}'
$productcode64 = '{39600969-41C3-4658-876E-16F108FC5C92}'
$productcode = @{32=$productcode32;64=$productcode64}[(Get-ProcessorBits)]

Uninstall-ChocolateyPackage `
  -PackageName 'isorecorder' `
  -FileType 'MSI' `
  -Silent "$productcode /QN"
