param($id)

$ErrorActionPreference = 'Stop'

$here = Split-Path $MyInvocation.MyCommand.Definition
$package = Join-Path $here (Join-Path 'packages' $id)

# Run an arbitrary Win32 application so LASTEXITCODE is 0
setx.exe trigger 1

choco.exe install --force --debug --verbose --yes $id --source "$package;http://chocolatey.org/api/v2/"

# Vagrant has issues knowing that there was an error
if ($LASTEXITCODE -ne 0) {
  exit $LASTEXITCODE
}
