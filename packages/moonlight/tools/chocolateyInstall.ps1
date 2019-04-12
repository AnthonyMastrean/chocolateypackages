Install-ChocolateyPackage `
    -PackageName 'moonlight' `
    -Url 'https://github.com/moonlight-stream/moonlight-qt/releases/download/v0.10.0/MoonlightSetup-x86-0.10.0.exe' `
    -Checksum 'CC0F48FEE4212418DDB2EBA2886AF69A9FEF5110B42F1B79EAAFF421A7DA6127' `
    -ChecksumType 'SHA256' `
    -Url64 'https://github.com/moonlight-stream/moonlight-qt/releases/download/v0.10.0/MoonlightSetup-x64-0.10.0.exe' `
    -Checksum64 'E19DD0C5150C1BA5C66A90FB630DBE8FCD81806BBD2A3FF486AA4FA84A74A8DE' `
    -ChecksumType64 'SHA256' `
    -FileType 'EXE' `
    -SilentArgs '/QUIET /NORESTART'
