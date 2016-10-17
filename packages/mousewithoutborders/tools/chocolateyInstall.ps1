Install-ChocolateyPackage `
  -PackageName 'mousewithoutborders' `
  -Url 'https://download.microsoft.com/download/6/5/8/658AFC4C-DC02-4CB8-839D-10253E89FFF7/MouseWithoutBordersSetup.msi' `
  -Checksum '53626A4793BF679B492FD9E16F1337D07B0D95121C4D82A553D320C56DF54FE3' `
  -ChecksumType 'SHA256' `
  -FileType 'MSI' `
  -SilentArgs '/QN'
