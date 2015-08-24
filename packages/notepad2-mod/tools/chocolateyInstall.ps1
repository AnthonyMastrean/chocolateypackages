$ErrorActionPreference = 'Stop'

$package_args = @{
  packageName = 'notepad2-mod'
  url         = 'https://github.com/XhmikosR/notepad2-mod/releases/download/4.2.25.955/Notepad2-mod.4.2.25.955.exe'
  checksum    = '8778ec79de94c8bedbbd0ebd27841f01'
  fileType    = 'EXE'
  silentArgs  = '/VERYSILENT /NORESTART'
}

Install-ChocolateyPackage @package_args
