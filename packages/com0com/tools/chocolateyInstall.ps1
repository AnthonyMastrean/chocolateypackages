$tools = Split-Path -Path $MyInvocation.MyCommand.Definition
$target32 = Join-Path -Path $tools -ChildPath 'Setup_com0com_v3.0.0.0_W7_x86_signed.exe'
$target64 = Join-Path -Path $tools -ChildPath 'Setup_com0com_v3.0.0.0_W7_x64_signed.exe'
$target = @{32=$target32;64=$target64}[(Get-OSArchitectureWidth)]

Install-ChocolateyZipPackage `
    -PackageName 'com0com' `
    -Url 'https://downloads.sourceforge.net/project/com0com/com0com/3.0.0.0/com0com-3.0.0.0-i386-and-x64-signed.zip' `
    -Checksum '6E5D4359865277430D4AE88C73FB7E648A0ED8E81AEA5002478179CFCB0BB0E1' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $tools

Install-ChocolateyInstallPackage `
    -PackageName 'com0com' `
    -FileType 'EXE' `
    -SilentArgs '/S' `
    -File $target

New-Item -Type File -Path "$target32.ignore" -Force | Out-Null
New-Item -Type File -Path "$target64.ignore" -Force | Out-Null
