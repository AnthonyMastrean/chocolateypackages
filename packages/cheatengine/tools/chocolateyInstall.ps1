Install-ChocolateyPackage `
  -PackageName 'cheatengine' `
  -FileType 'EXE' `
  -Silent '/VERYSILENT /NORESTART /NOCANDY' `
  -Url 'https://github.com/cheat-engine/cheat-engine/releases/download/6.7/CheatEngine67.exe' `
  -Checksum '9F498954B628B7CD9989A4EE2339601CFCBB58C8A32BFA2D0C8BC2ADBD1D90AE' `
  -ChecksumType 'SHA256'
