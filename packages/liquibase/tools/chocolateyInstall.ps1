$name   = 'liquibase'
$url    = 'http://sourceforge.net/projects/liquibase/files/Liquibase%20Core/liquibase-3.2.0-bin.zip/download'
           
$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$bat     = Join-Path $content 'liquibase.bat'

Install-ChocolateyZipPackage $name $url $content
Generate-BinFile $name $bat
