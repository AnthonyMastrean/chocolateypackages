$target = Join-Path $ENV:PROGRAMFILES 'Microsoft JDBC DRIVER 6.0 for SQL Server'

Install-ChocolateyPackage `
    -PackageName 'sqljdbc' `
    -FileType 'EXE' `
    -SilentArgs "'/auto `"$target`"'" `
    -Url 'https://download.microsoft.com/download/3/F/7/3F74A9B9-C5F0-43EA-A721-07DA590FD186/sqljdbc_6.2.2.0_enu.exe' `
    -Checksum 'E066C2647F3FB44E0D826412DFA0C86E509168DAFFC28F20D840603290D9F097' `
    -ChecksumType 'SHA256' `
