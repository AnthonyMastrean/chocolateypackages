$product_code_32 = '{655AC758-FFBE-4DAC-9205-FDBC10B50DB2}'
$product_code_64 = '{F6BEC317-F689-4158-B1F0-F229B794CFBA}'
$product_code = @{32=$product_code_32;64=$product_code_64}[(Get-ProcessorBits)]

Uninstall-ChocolateyPackage `
  -PackageName 'diffmerge' `
  -FileType 'MSI' `
  -Silent "$product_code /QN"
