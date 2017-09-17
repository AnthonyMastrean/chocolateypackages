$id    = "ag"
$url   = "https://github.com/k-takata/the_silver_searcher-win32/releases/download/2017-08-31%2F2.1.0-1/ag-2017-08-31_2.1.0-1-x86.zip"
$url64 = "https://github.com/k-takata/the_silver_searcher-win32/releases/download/2017-08-31%2F2.1.0-1/ag-2017-08-31_2.1.0-1-x64.zip"

$toolsPath  = Split-Path $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName   = $id
    url           = $url
    url64         = $url64
    unzipLocation = $toolsPath
}

Install-ChocolateyZipPackage @packageArgs
