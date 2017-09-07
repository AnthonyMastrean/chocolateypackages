$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$legacy = Join-Path $content 'cloc-*.exe'
$target = Join-Path $content 'cloc.exe'

New-Item -Path $content -Type 'Directory' -Force | Out-Null

# Remove legacy executables (from before we renamed the web file)
Remove-Item -Path $legacy -Force | Out-Null

Get-ChocolateyWebFile `
    -PackageName 'cloc' `
    -Url 'https://github.com/AlDanial/cloc/releases/download/v1.72/cloc-1.72.exe' `
    -Checksum 'CDBBBA435649FF6EFBCEB2824BC1404091FCF09D78547507DEE4BB3E3AB841DF' `
    -ChecksumType 'SHA256' `
    -FileFullPath $target
