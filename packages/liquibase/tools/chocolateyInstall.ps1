$id  = 'liquibase'
$url = 'https://github.com/liquibase/liquibase/releases/download/liquibase-parent-3.3.5/liquibase-3.3.5-bin.zip'

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$bat     = Join-Path $content 'liquibase.bat'

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation $content

Install-BinFile -Name $id -Path $bat
