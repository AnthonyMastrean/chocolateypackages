$target = Join-Path $ENV:PROGRAMFILES 'Microsoft JDBC DRIVER 7.0 for SQL Server'

Install-ChocolateyPackage `
    -PackageName 'sqljdbc' `
    -FileType 'EXE' `
    -SilentArgs "'/auto `"$target`"'" `
    -Url 'https://download.microsoft.com/download/2/F/C/2FC75210-EDDE-464C-8E54-45C0291032FF/sqljdbc_7.0.0.0_enu.exe' `
    -Checksum '922C9347D0B94FE09A5344C302D0748107DC30D672256880909542F48B9F038A' `
    -ChecksumType 'SHA256' `
