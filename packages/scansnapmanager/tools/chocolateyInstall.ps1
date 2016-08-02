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
    -Url 'http://origin.pfultd.com/downloads/IMAGE/driver/ss/mgr/w-ix500/WiniX500ManagerV65L40WW.exe' `
    -Checksum '54E483EA1E9136C8184039098464C37B7EF711CD2C80FCA703419D1F58722D09' `
    -ChecksumType 'SHA256' `
    -SilentArgs "/S /f1`"$response`""
