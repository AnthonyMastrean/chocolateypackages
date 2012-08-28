$name = 'bitstream.vera.fonts'
$url  = 'http://ftp.gnome.org/pub/GNOME/sources/ttf-bitstream-vera/1.10/ttf-bitstream-vera-1.10.zip'

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$zip     = Join-Path $content 'ttf-bitstream-vera-1.10'

Install-ChocolateyZipPackage $name $url $content

try {
    Remove-Item "$zip\**" -Exclude '*.ttf' -Recurse -Force

    $FONT_FOLDER = 0x14
    $shell = New-Object -ComObject Shell.Application
    $source = $shell.Namespace($zip)
    $target = $shell.Namespace($FONT_FOLDER)
    $target.CopyHere($source.Items())
    
    Write-ChocolateySuccess $name
} 
catch {
    Write-ChocolateyFailure $name $($_.Exception.Message)
    throw 
}
