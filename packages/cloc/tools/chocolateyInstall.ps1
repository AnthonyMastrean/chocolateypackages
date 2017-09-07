$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$legacy = Join-Path $content 'cloc-*.exe'
$target = Join-Path $content 'cloc.exe'

New-Item -Path $content -Type 'Directory' -Force | Out-Null

# Remove legacy executables (from before we renamed the web file)
Remove-Item -Path $legacy -Force | Out-Null

Get-ChocolateyWebFile `
    -PackageName 'cloc' `
    -Url 'https://github.com/AlDanial/cloc/releases/download/v1.70/cloc-1.70.exe' `
    -Checksum '1C1A64FFF0C7065954C52C36D288D800D9B18C558162AAB3BD239D2E537476F0' `
    -ChecksumType 'SHA256' `
    -FileFullPath $target
