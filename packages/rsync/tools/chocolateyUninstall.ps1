$tools = Split-Path $MyInvocation.MyCommand.Definition

# This package requires the CWRSYNC_HOME directory on the PATH and a HOME
# environment variable. This cannot be provided with Chocolatey's automatic
# shimming. I have to shim custom batch files.
Get-ChildItem $tools\*.bat | %{ Uninstall-BinFile -Name $_.BaseName -Path $_ }
