$ErrorActionPreference = 'Stop'

$package_args = @{
  packageName = 'notepad2'
  url         = 'http://www.flos-freeware.ch/zip/Notepad2_4.2.25_x86.exe'
  url64       = 'http://www.flos-freeware.ch/zip/Notepad2_4.2.25_x64.exe'
  checksum    = '34fcbb1967f68e51135d12043f067c23'
  checksum64  = '8f90342b137d8e42ab97183071c7e6aa'
  fileType    = 'EXE'
  silentArgs  = '/SILENT'
}

Install-ChocolateyPackage @package_args
