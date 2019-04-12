$tools = Split-Path -Path $MyInvocation.MyCommand.Definition
$content = Join-Path -Path (Split-Path -Path $tools) -ChildPath 'content'

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
  'nsupdate.exe',
  'readme1st.txt'
)

Install-ChocolateyZipPackage `
  -PackageName 'bind' `
  -Url 'https://www.isc.org/downloads/file/bind-9-12-4/?version=win-32-bit' `
  -Checksum '2EA0C80233C31B1854BE2B5F8B68D34F0E8DAAD355A658DBA6951E940D0A7300' `
  -ChecksumType 'SHA256' `
  -Url64 'https://www.isc.org/downloads/file/bind-9-12-4/?version=win-64-bit' `
  -Checksum64 '3C004658CEFBA6FAA2843E3894FF867F642D7758B5D337953A0E7AC014BA6DF5' `
  -ChecksumType64 'SHA256' `
  -UnzipLocation $content `

Get-ChildItem $content `
  | ?{ $keep -notcontains $_ } `
  | Remove-Item -Force -Recurse
