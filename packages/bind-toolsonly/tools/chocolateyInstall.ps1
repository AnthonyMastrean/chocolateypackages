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
  -Url 'https://www.isc.org/downloads/file/bind-9-14-0/?version=win-32-bit' `
  -Checksum '1F2AEBAD977C9625D01F806F78B21A4E788FF431F91587431AB73AD60DEC52A5' `
  -ChecksumType 'SHA256' `
  -Url64 'https://www.isc.org/downloads/file/bind-9-14-0/?version=win-64-bit' `
  -Checksum64 'A81CA8327DA0A4C7C8042F8947A80A11E9E98C9EA741105622D04D7EB9BBD3B4' `
  -ChecksumType64 'SHA256' `
  -UnzipLocation $content `

Get-ChildItem $content `
  | ?{ $keep -notcontains $_ } `
  | Remove-Item -Force -Recurse
