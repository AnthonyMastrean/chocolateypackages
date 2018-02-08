# The installer cannot overwrite the current or previous version, so we have
# to do this here, unfortunately.
#
Uninstall-ChocolateyPackage `
  -PackageName 'mousewithoutborders' `
  -FileType    'MSI' `
  -ValidExitcodes 0, 1605 `
  -SilentArgs  '{D3BC954F-D661-474C-B367-30EB6E56542E} /QN'
