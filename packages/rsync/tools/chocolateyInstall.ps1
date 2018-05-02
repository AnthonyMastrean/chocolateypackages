$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$content = Join-Path $package 'cwrsync_5.7.1_x86_free'

Install-ChocolateyZipPackage `
    -PackageName 'rsync' `
    -Url 'https://www.itefix.net/dl/cwrsync_5.7.1_x86_free.zip' `
    -Checksum '379dc8534b808bdd6c454470b293c1b65be8373f279fb0c1ea0a2e52a3cc5502' `
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
