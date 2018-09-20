Install-ChocolateyPackage `
  -PackageName 'cheatengine' `
  -Url 'https://github.com/cheat-engine/cheat-engine/releases/download/v6.8.1/CheatEngine681.exe' `
  -Checksum '6F795F11FA3983B4779426DD6DCE8346E279B099F62AD4BAB5D246B932E09885' `
  -ChecksumType 'SHA256' `
  -FileType 'EXE' `
  -Silent '/VERYSILENT /NORESTART /NOCANDY'
