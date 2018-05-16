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
  -Url 'https://www.isc.org/downloads/file/bind-9-10-7/?version=win-32-bit' `
  -Checksum '79B44FA7B638CD1044D1B3BBD4583733D06C70F41DAEC30DFE30CF4320CCAD9D' `
  -ChecksumType 'SHA256' `
  -Url64 'https://www.isc.org/downloads/file/bind-9-10-7/?version=win-64-bit' `
  -Checksum64 '7ABBE0809C2A0D05C11F3D8699B34C67DC7F47E4C46F587BD805A93B0D14149E' `
  -ChecksumType64 'SHA256' `
  -UnzipLocation $content `

Get-ChildItem $content `
  | ?{ $keep -notcontains $_ } `
  | Remove-Item -Force -Recurse
