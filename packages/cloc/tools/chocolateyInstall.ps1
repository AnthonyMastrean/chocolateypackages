$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$legacy = Join-Path $content 'cloc-*.exe'
$target = Join-Path $content 'cloc.exe'

New-Item -Path $content -Type 'Directory' -Force | Out-Null

# Remove legacy executables (from before we renamed the web file)
Remove-Item -Path $legacy -Force | Out-Null

Get-ChocolateyWebFile `
    -PackageName 'cloc' `
    -Url 'https://github.com/AlDanial/cloc/releases/download/1.80/cloc-1.80.exe' `
    -Checksum '9E547B01C946AA818FFAD43B9EBAF05D3DA08ED6CA876EF2B6847BE3BF1CF8BE' `
    -ChecksumType 'SHA256' `
    -FileFullPath $target
