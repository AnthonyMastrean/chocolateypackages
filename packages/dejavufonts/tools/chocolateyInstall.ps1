$name = "dejavufonts"
$url = "http://downloads.sourceforge.net/project/dejavu/dejavu/2.34/dejavu-fonts-ttf-2.34.zip"

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"
$zip = Join-Path $content "dejavu-fonts-ttf-2.34\ttf"

Install-ChocolateyZipPackage $name $url $content

try {
  $FONT_FOLDER = 0x14
  $shell = New-Object -ComObject "Shell.Application"
  $source = $shell.Namespace($zip)
  $target = $shell.Namespace($FONT_FOLDER)
  $target.CopyHere($source.Items())
  
  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  throw 
}
