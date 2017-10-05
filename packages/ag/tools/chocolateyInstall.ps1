$url        = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2017-08-31%2F2.1.0-1/ag-2017-08-31_2.1.0-1-x86.zip'
$checksum   = '28456A424A30B12BE3BE2B9D427BC67031BC436F87F1100607CFA9A44C1AF95D'
$url64      = 'https://github.com/k-takata/the_silver_searcher-win32/releases/download/2017-08-31%2F2.1.0-1/ag-2017-08-31_2.1.0-1-x64.zip'
$checksum64 = '2F0B83E705D6224DF82BE92014726875BEC925C6B56EF84170D1F19EDDFAA439'

$id                    = 'ag'
$checksumType          = 'sha256'
$checksumType64        = 'sha256'
$ErrorActionPreference = 'Stop';
$toolsDir              = Split-Path $MyInvocation.MyCommand.Definition

Install-ChocolateyZipPackage `
    -PackageName $id `
    -UnzipLocation $toolsDir `
    -Url $url `
    -Url64 $url64 `
    -Checksum $checksum `
    -ChecksumType $checksumType `
    -Checksum64 $checksum64 `
    -ChecksumType64 $checksumType64 `
