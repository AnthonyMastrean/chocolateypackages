$name = 'bind.toolsonly'
$url  = 'http://ftp.isc.org/isc/bind9/9.9.3-P1/BIND9.9.3-P1.zip'

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$temp    = Join-Path (Split-Path $tools) 'temp'
$content = Join-Path (Split-Path $tools) 'content'

$keep = @(
  'arpaname.exe',
  'bindevt.dll',
  'dig.exe',
  'host.exe',
  'libbind9.dll',
  'libdns.dll',
  'libeay32.dll',
  'libisc.dll',
  'libisccc.dll',
  'libisccfg.dll',
  'liblwres.dll',
  'libxml2.dll',
  'nslookup.exe',
  'nsupdate.exe',
  'readme1st.txt'
) | %{ Join-Path $temp $_ }

try {
  Install-ChocolateyZipPackage $name $url $temp
  
  New-Item $content -Type Directory
  Move-Item -Path $keep -Destination $content
  Remove-Item $temp -Force -Recurse

  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw 
}
