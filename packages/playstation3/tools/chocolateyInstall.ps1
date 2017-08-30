$target = Join-Path (Join-Path (Join-Path (Get-ToolsLocation) 'playstation3') '4.81') 'PS3UPDAT.PUP'

Get-ChocolateyWebFile `
  -PackageName 'playstation3' `
  -FileFullPath $target `
  -Url 'http://dus01.ps3.update.playstation.net/update/ps3/image/us/2016_1101_b2483b4abc157494447c9c409c036041/PS3UPDAT.PUP' `
  -Checksum 'C08BBAABA2063B432A9253EEC8F7FBC3A57E57478F98A7508A6CAB54CB150F65' `
  -ChecksumType 'SHA256' `
  -GetOriginalFileName
