param($id)

$ErrorActionPreference = 'Stop'

$here = Split-Path $MyInvocation.MyCommand.Definition
$package = Join-Path $here (Join-Path 'packages' $id)

# Run an arbitrary Win32 application so LASTEXITCODE is 0
setx trigger 1

choco install --force --debug --verbose --yes --source "$package;http://chocolatey.org/api/v2/" $id

# Vagrant has issues knowing that there was an error
if ($LASTEXITCODE -ne 0) {
  exit $LASTEXITCODE
}
