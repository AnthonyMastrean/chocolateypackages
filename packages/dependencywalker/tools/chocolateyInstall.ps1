$id    = "dependencywalker"
$url   = "http://www.dependencywalker.com/depends22_x86.zip"
$url64 = "http://www.dependencywalker.com/depends22_x64.zip"

$tools   = Split-Path -parent $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$depends = Join-Path $content "depends.exe"

. $tools\bins.ps1

Install-ChocolateyZipPackage `
    -PackageName $id `
    -Url $url `
    -Checksum '03d73abba0e856c81ba994505373fdb94a13b84eb29e6c268be1bf21b7417ca3' `
    -ChecksumType 'SHA256' `
    -Url64 $url64 `
    -Checksum64 '35db68a613874a2e8c1422eb0ea7861f825fc71717d46dabf1f249ce9634b4f1' `
    -ChecksumType64 'SHA256' `
    -UnzipLocation $content

New-GuiBin -Name $depends
