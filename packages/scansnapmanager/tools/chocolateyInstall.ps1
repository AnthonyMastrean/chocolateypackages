$tools = Split-Path $MyInvocation.MyCommand.Definition

$response32 = Join-Path $tools 'install32.iss'
$response64 = Join-Path $tools 'install64.iss'
$response = @{32=$response32;64=$response64}[(Get-ProcessorBits)]

# This an InstallShield installer, requiring a response file (.ISS) for silent
# installation.
#
Install-ChocolateyPackage `
    -PackageName 'scansnapmanager' `
    -FileType 'EXE' `
    -Url 'http://origin.pfultd.com/downloads/IMAGE/driver/ss/mgr/w-s1500/WinS1500ManagerV55L10WW.exe' `
    -Checksum '236EB287A10598E7D37F5A0F515759A8B4F2F86B5C9B375315B7D1C97DED26D4' `
    -ChecksumType 'SHA256' `
    -SilentArgs "/S /f1`"$response`""
