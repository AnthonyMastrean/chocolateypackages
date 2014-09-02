$id = "veryseriousbutton"
$url = "https://github.com/gregcourville/VerySeriousButton-VerySeriousSetup/releases/download/v0.1-alpha/VerySeriousSetup.exe"

$tools = Split-Path $MyInvocation.MyCommand.Definition

$content = Join-Path (Split-Path $tools) "content"
$target = Join-Path $content "VerySeriousSetup.exe"
$gui = Join-Path $content "VerySeriousSetup.exe.gui"

New-Item $content -Type "Directory" -Force | Out-Null
New-Item $gui -Type "File" -Force | Out-Null

Get-ChocolateyWebFile $id $target $url
