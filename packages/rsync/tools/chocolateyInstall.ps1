$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$content = Join-Path $package 'cwrsync_5.5.0_x86_free'

Install-ChocolateyZipPackage `
    -PackageName 'rsync' `
    -Url 'https://web.archive.org/web/20160613105413/https://www.itefix.net/dl/cwRsync_5.5.0_x86_Free.zip' `
    -Checksum '37E8EF21AC975D4EE86C9D3BE40C8935E8B9D0BA84E9302FC106B9452296CB85' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $package

Install-ChocolateyEnvironmentVariable `
    -VariableName 'CWRSYNC_HOME' `
    -VariableValue $content `
    -VariableType 'Machine'

# This package requires the CWRSYNC_HOME directory on the PATH and a HOME
# environment variable. This cannot be provided with Chocolatey's automatic
# shimming. I have to shim custom batch files.
Get-ChildItem $tools\*.bat | %{ Install-BinFile -Name $_.BaseName -Path $_ }
Get-ChildItem $content\bin\*.exe | %{ New-Item -Type 'File' -Path "$_.ignore" -Force | Out-Null }

Update-SessionEnvironment
