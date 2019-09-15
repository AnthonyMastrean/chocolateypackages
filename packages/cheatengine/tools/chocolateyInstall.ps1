Install-ChocolateyPackage `
  -PackageName 'cheatengine' `
  -Url 'https://github.com/cheat-engine/cheat-engine/releases/download/7.0/CheatEngine70.exe' `
  -Checksum '7A8B67E21610207B3BD6012C0D798450D3127280A5EDC5E78C8026581DC021F4' `
  -ChecksumType 'SHA256' `
  -FileType 'EXE' `
  -Silent '/VERYSILENT /NORESTART /NOCANDY'
