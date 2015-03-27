$id  = 'liquibase'
$url = 'http://sourceforge.net/projects/liquibase/files/Liquibase%20Core/liquibase-3.3.2-bin.zip/download'

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$bat     = Join-Path $content 'liquibase.bat'
$shim    = Join-Path $ENV:chocolateyInstall 'bin\liquibase.exe'
$shimgen = Join-Path $ENV:chocolateyInstall 'tools\shimgen.exe'

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation $content

& $shimgen --output="$shim" --path="$bat"
