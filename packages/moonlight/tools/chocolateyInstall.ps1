Install-ChocolateyPackage `
    -PackageName 'moonlight' `
    -Url 'https://github.com/moonlight-stream/moonlight-qt/releases/download/v0.8.0/MoonlightSetup-x86-0.8.0.exe' `
    -Checksum 'CC9CC50AFDB795B038251E0DA850D9DBAC6704DABA6A6325BFBAE43634DE339B' `
    -ChecksumType 'SHA256' `
    -Url64 'https://github.com/moonlight-stream/moonlight-qt/releases/download/v0.8.0/MoonlightSetup-x64-0.8.0.exe' `
    -Checksum64 '4101003961F4FF11C333628450881B2DC127634C1776FE9145519C38832B1A20' `
    -ChecksumType64 'SHA256' `
    -FileType 'EXE' `
    -SilentArgs '/QUIET /NORESTART'
