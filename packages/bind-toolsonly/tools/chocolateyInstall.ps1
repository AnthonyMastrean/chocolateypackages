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
  -Url 'http://ftp.isc.org/isc/bind9/9.10.3-P4/BIND9.10.3-P4.x86.zip' `
  -Url64 'http://ftp.isc.org/isc/bind9/9.10.3-P4/BIND9.10.3-P4.x64.zip' `
  -Checksum '9AE88282924CE70D445D006D2EE57987355A0F1951859E42E4AF58D7D17812F3' `
  -Checksum64 '19B7863CF029D9EB5C2BE033DA2C3D853A91E40929585224A4004381F88EB967' `
  -ChecksumType 'SHA256' `
  -ChecksumType64 'SHA256' `
  -UnzipLocation $content `

Get-ChildItem $content `
  | ?{ $keep -notcontains $_ } `
  | Remove-Item -Force -Recurse
