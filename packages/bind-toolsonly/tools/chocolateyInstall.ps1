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
  -Url 'https://www.isc.org/downloads/file/bind-9-12-1/?version=win-32-bit' `
  -Checksum '8E7474509846E15CEF966B0A5786FF79DC898EB7F90A83C2109C59FCBAD8C6ED' `
  -ChecksumType 'SHA256' `
  -Url64 'https://www.isc.org/downloads/file/bind-9-12-1/?version=win-64-bit' `
  -Checksum64 '8946B29544D97E2217110AEB42D6F86C43625614A9F2DAC4509CA8099D276A46' `
  -ChecksumType64 'SHA256' `
  -UnzipLocation $content `

Get-ChildItem $content `
  | ?{ $keep -notcontains $_ } `
  | Remove-Item -Force -Recurse
