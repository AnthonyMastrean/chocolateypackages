$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -Path $MyInvocation.MyCommand.Definition
$contentDir = Join-Path -Path (Split-Path -Path $toolsDir) -ChildPath 'content'

$url64      = 'https://downloads.isc.org/isc/bind9/9.16.8/BIND9.16.8.x64.zip'
$checksum64 = '1D84D74AD80E31D43A679B4C97360235073F5FF33A3CD2FD24A102CADE444EF825B4978CA6913343C9C20194BBB0D6F9D8DF90AF5AB2CD57A26D54A2982247F4'

$packageArgs = @{
  packageName    = $Env:ChocolateyPackageName
  unzipLocation  = $contentDir

  url64          = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha512'
}

$keep = @(
  'arpaname.exe',
  'bindevt.dll',
  'delv.exe',
  'dig.exe',
  'host.exe',
  'libbind9.dll',
  'libdns.dll',
  'libeay32.dll',
  'libirs.dll',
  'libisc.dll',
  'libisccc.dll',
  'libisccfg.dll',
  'liblwres.dll',
  'libxml2.dll',
  'nslookup.exe',
  'nsupdate.exe'
)

$keepExtensions = @(
  '.md',
  ''
)

Install-ChocolateyZipPackage @packageArgs
Get-ChildItem $contentDir `
  | Where-Object {
    if ($keep -contains $_) {
      return $false
    }

    if ($keepExtensions -contains $_.Extension) {
      return $false
    }

    return $true
  } `
  | Remove-Item -Force -Recurse
