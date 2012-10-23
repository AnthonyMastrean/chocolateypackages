$name = 'bind.toolsonly'
$url  = 'http://www.isc.org/software/bind/992/download/bind992zip'

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
