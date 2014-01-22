$name   = 'liquibase'
$url    = 'http://downloads.sourceforge.net/project/liquibase/Liquibase%20Core/liquibase-3.0.0-beta1-bin.zip'

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$bat     = Join-Path $content 'liquibase.bat'

Install-ChocolateyZipPackage $name $url $content
Generate-BinFile $name $bat
