Install-ChocolateyPackage `
  -PackageName 'cheatengine' `
  -FileType 'EXE' `
  -Silent '/VERYSILENT /NORESTART /NOCANDY' `
  -Url 'https://github.com/cheat-engine/cheat-engine/releases/download/6.6/CheatEngine66.exe' `
  -Checksum '3F3D4CC77F7192A7E55A8C44CDADE07FCF9D12A2DFE82AAC46CB5F2E12CCCF4E' `
  -ChecksumType 'SHA256'
