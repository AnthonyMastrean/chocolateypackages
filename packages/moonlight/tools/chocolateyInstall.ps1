Install-ChocolateyPackage `
    -PackageName 'moonlight' `
    -Url 'https://github.com/moonlight-stream/moonlight-qt/releases/download/v0.5.1/MoonlightSetup-x86-0.5.1.exe' `
    -Checksum 'F775F3C2C246D6D3DC3349EB58A7370D7BC54238FF7D365DCEC445D02830D84C' `
    -ChecksumType 'SHA256' `
    -Url64 'https://github.com/moonlight-stream/moonlight-qt/releases/download/v0.5.1/MoonlightSetup-x64-0.5.1.exe' `
    -Checksum64 'E64ABAA8ECB414468261857CF629F74367D9ABFD9DFA8060A1AFE10D1DF19368' `
    -ChecksumType64 'SHA256' `
    -FileType 'EXE' `
    -SilentArgs '/QUIET /NORESTART'
