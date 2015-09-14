$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

$keep = @(
  'arpaname.exe',
  'bindevt.dll',
  'BINDInstall.exe',
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
  -Url 'http://ftp.isc.org/isc/bind9/9.10.2-P4/BIND9.10.2-P4.x86.zip' `
  -Url64 'http://ftp.isc.org/isc/bind9/9.10.2-P4/BIND9.10.2-P4.x64.zip' `
  -Checksum '9814f6109699c167a0a0996bbc8c2e36' `
  -Checksum64 '0f59aa797943ccece2e16496c76535ff' `
  -UnzipLocation $content `

Get-ChildItem $content `
  | ?{ $keep -notcontains $_ } `
  | Remove-Item -Force -Recurse
