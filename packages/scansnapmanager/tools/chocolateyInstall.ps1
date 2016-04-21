$tools = Split-Path $MyInvocation.MyCommand.Definition
$response = Join-Path $tools 'Setup.iss'

# This an InstallShield installer, requiring a response file (.ISS) for silent
# installation.
#
Install-ChocolateyPackage `
    -PackageName 'scansnapmanager' `
    -FileType 'EXE' `
    -Url 'http://origin.pfultd.com/downloads/IMAGE/driver/ss/mgr/w-s1300/WinS1300ManagerV55L10WW.exe' `
    -Checksum 'b43aaa8f18b9b82529770779bea5cf24' `
    -SilentArgs "/S /f1`"$response`""
