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
  -Url 'https://downloads.isc.org/isc/bind9/9.14.2/BIND9.14.2.x86.zip' `
  -Checksum 'B298210F80BE2E4813DE916202213393AB57C272BF25B7CB1392AC22E5DA4D97' `
  -ChecksumType 'SHA256' `
  -Url64 'https://downloads.isc.org/isc/bind9/9.14.2/BIND9.14.2.x64.zip' `
  -Checksum64 'E49C525D16DB0348F5580E13D480323F24AC4FF39C93992D115393AFEC8486E1' `
  -ChecksumType64 'SHA256' `
  -UnzipLocation $content `

Get-ChildItem $content `
  | ?{ $keep -notcontains $_ } `
  | Remove-Item -Force -Recurse
