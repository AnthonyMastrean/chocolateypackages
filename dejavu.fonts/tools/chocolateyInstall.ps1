$name = 'dejavu.fonts'
$url  = 'http://downloads.sourceforge.net/project/dejavu/dejavu/2.33/dejavu-fonts-ttf-2.33.zip?r=http%3A%2F%2Fdejavu-fonts.org%2Fwiki%2FDownload&ts=1346123195&use_mirror=voxel'

$FONTS = 0x14

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$zip     = Join-Path $content 'dejavu-fonts-ttf-2.33\ttf'

Install-ChocolateyZipPackage $name $url $content

try {
    $shell = New-Object -ComObject Shell.Application
    $source = $shell.Namespace($zip)
    $target = $shell.Namespace($FONTS)
    $target.CopyHere($source.Items())
    
    Write-ChocolateySuccess $name
} 
catch {
    Write-ChocolateyFailure $name $($_.Exception.Message)
    throw 
}
