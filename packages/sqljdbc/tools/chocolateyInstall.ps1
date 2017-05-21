$target = Join-Path $ENV:PROGRAMFILES 'Microsoft JDBC DRIVER 6.0 for SQL Server'

Install-ChocolateyPackage `
    -PackageName 'sqljdbc' `
    -FileType 'EXE' `
    -SilentArgs "'/auto `"$target`"'" `
    -Url 'https://download.microsoft.com/download/0/2/A/02AAE597-3865-456C-AE7F-613F99F850A8/enu/sqljdbc_6.0.8112.100_enu.exe' `
    -Checksum 'DF6921B801D3C5AEFD85B94F7A183CAF099E0B1867D2973CD8AF2856077AFA79' `
    -ChecksumType 'SHA256' `
