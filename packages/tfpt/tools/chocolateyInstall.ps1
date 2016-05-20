Install-ChocolateyPackage `
    -PackageName 'tfpt' `
    -FileType 'MSI' `
    -SilentArgs '/Q ADDLOCAL=ALL' `
    -Url 'https://visualstudiogallery.msdn.microsoft.com/f017b10c-02b4-4d6d-9845-58a06545627f/file/112253/3/Visual%20Studio%20Team%20Foundation%20Server%202013%20Update%202%20Power%20Tools%20.msi' `
    -Checksum '305ADDEAE5FCBFE99B1EAE9DFC4B4046F82246AC3A0026420189A8F1E7F6C979' `
    -ChecksumType 'SHA256'

$programs = @{64=${ENV:PROGRAMFILES(X86)};32=$ENV:PROGRAMFILES}[(Get-ProcessorBits)]
$bin = Join-Path $programs 'Microsoft Team Foundation Server 2013 Power Tools'

Install-ChocolateyPath `
    -PathToInstall $bin `
    -PathType 'Machine'
