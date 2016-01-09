$packageName = 'GOGGalaxy'
$version = '{{PackageVersion}}'
$url = "http://cdn.gog.com/open/galaxy/client/setup_galaxy_1.1.5.28.exe"
$fileType = 'EXE'
$silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-' # Inno Setup
$validExitCodes = @(0)

Install-ChocolateyPackage $packageName $fileType $silentArgs $url -validExitCodes $validExitCodes
