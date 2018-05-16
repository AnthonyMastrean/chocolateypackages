$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

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
  -Url 'https://www.isc.org/downloads/file/bind-9-11-3/?version=win-32-bit' `
  -Checksum '90A938C12B8C3BFF63463A5DF659BD419412CF9986592696A1BB007E5F5C9352' `
  -ChecksumType 'SHA256' `
  -Url64 'https://www.isc.org/downloads/file/bind-9-11-3/?version=win-64-bit' `
  -Checksum64 'DE958C4CF72DBC64DCBB42130BD466D9FD367E4519C5C3F78A6675CA87E12B7D' `
  -ChecksumType64 'SHA256' `
  -UnzipLocation $content `

Get-ChildItem $content `
  | ?{ $keep -notcontains $_ } `
  | Remove-Item -Force -Recurse
