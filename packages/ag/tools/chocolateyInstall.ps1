$ErrorActionPreference = 'Stop';
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'ag'
  url            = 'https://github.com/JFLarvoire/the_silver_searcher/releases/download/2.2.5-Windows/ag-2021-11-14-2.2.5-x86.zip'
  checksum       = 'aee6e795f9c1bf2761318139cbb5ebeafdef99b9eadc82461e190af597860b7f'
  url64          = 'https://github.com/JFLarvoire/the_silver_searcher/releases/download/2.2.5-Windows/ag-2021-11-14-2.2.5-amd64.zip'
  checksum64     = 'ecde6ebcbd2d33ab9f50cca0800db4bd2ba183bdb7832a9d0b5ad05a684de958'
  checksumType   = 'sha256'
  checksumType64 = 'sha256'
  unzipLocation  = $toolsDir
}

# Check if there are other conflicting packages installed by other package managers
# Winget registers the package uninstall command in the registry
if (Test-Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\The Silver Searcher') {
  Throw "Found another instance of ag installed by Winget.`n Please uninstall it first using 'winget uninstall `"The Silver Searcher`"' and retry.`n"
}
# Scoop installs shims, like Chocolatey, in the same directory as scoop.ps1
foreach ($scoop in (get-command scoop.ps1)) {
  $dir = (get-item $scoop.Path).DirectoryName
  $ag = Join-Path $dir ag.exe
  if (test-path $ag) {
    Throw "Found another instance of ag installed by Scoop.`n Please uninstall it first using 'scoop uninstall ag' and retry.`n"
  } else {
    Write-Verbose "Found a Scoop installation in '$dir', but it does not contain ag.exe."
  }
}

# OK, the installation can go on
Install-ChocolateyZipPackage @packageArgs
