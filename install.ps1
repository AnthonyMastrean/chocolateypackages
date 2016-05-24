param($id)

$ErrorActionPreference = 'Stop'

# Run an arbitrary Win32 application so LASTEXITCODE is 0
setx.exe trigger 1

choco.exe install --force --debug --verbose --yes $id --source "packages\$id;http://chocolatey.org/api/v2/"

# Vagrant has issues knowing that there was an error
if ($LASTEXITCODE -ne 0) {
  exit $LASTEXITCODE
}
