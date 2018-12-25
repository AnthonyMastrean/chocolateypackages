$version_without_dots = $env:ChocolateyPackageVersion -replace '[.]'

Install-ChocolateyPackage `
  -PackageName 'cheatengine' `
  -Url "https://github.com/cheat-engine/cheat-engine/releases/download/$($env:ChocolateyPackageVersion)/CheatEngine$($version_without_dots).exe" `
  -Checksum '61a35039e8da357e9d6f06642f417dc897ed9a077f6a99e84b46ada1a211d949' `
  -ChecksumType 'SHA256' `
  -FileType 'EXE' `
  -Silent '/VERYSILENT /NORESTART /NOCANDY'
