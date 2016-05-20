Install-ChocolateyPackage `
    -PackageName 'tfpt' `
    -FileType 'MSI' `
    -SilentArgs '/Q ADDLOCAL=ALL' `
    -Url 'https://visualstudiogallery.msdn.microsoft.com/b1ef7eb2-e084-4cb8-9bc7-06c3bad9148f/file/83775/3/Visual%20Studio%20Team%20Foundation%20Server%202012%20Update%202%20Power%20Tools.msi' `
    -Checksum 'A988F052D1D8CB694BB89BF147ACADE2A7E870CAE89B3982D480058CE8AB0B8F' `
    -ChecksumType 'SHA256'

$programs = @{64=${ENV:PROGRAMFILES(X86)};32=$ENV:PROGRAMFILES}[(Get-ProcessorBits 64)]
$bin = Join-Path $programs 'Microsoft Team Foundation Server 2012 Power Tools'

Install-ChocolateyPath `
    -PathToInstall $bin `
    -PathType 'Machine'
