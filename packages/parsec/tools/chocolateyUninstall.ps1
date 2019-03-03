$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$ahkExe = 'AutoHotKey'
$ahkFile = Join-Path $toolsDir "removeParsec.ahk"

$null = Start-Process -FilePath $ahkExe -ArgumentList $ahkFile

# Using Start-Process -Wait since Uninstall-ChocolateyPackage exits immediately
$uninstall = Start-Process -FilePath (Get-UninstallRegistryKey -SoftwareName 'Parsec').UninstallString -NoNewWindow -Wait -PassThru

if ($uninstall.ExitCode -notin 0,3010)
{
    throw "Removal of parsec was NOT successful. Exit code of process was $($uninstall.ExitCode)"
}
