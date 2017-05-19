Install-ChocolateyPackage `
  -PackageName 'cheatengine' `
  -FileType 'EXE' `
  -Silent '/VERYSILENT /NORESTART /NOCANDY' `
  -Url 'https://github.com/cheat-engine/cheat-engine/releases/download/6.6/CheatEngine66.exe' `
  -Checksum '2923AA77E59B8455E98B961B2D99405CA8C31137A859FFB43CA4C624BEB201E6' `
  -ChecksumType 'SHA256'
