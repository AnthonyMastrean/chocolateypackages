﻿$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$content = Join-Path $package 'cwRsync_5.5.0_x86_Free'

Install-ChocolateyZipPackage `
    -PackageName 'rsync' `
    -Url 'https://www.itefix.net/dl/cwRsync_5.5.0_x86_Free.zip' `
    -Checksum '37e8ef21ac975d4ee86c9d3be40c8935e8b9d0ba84e9302fc106b9452296cb85' `
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
