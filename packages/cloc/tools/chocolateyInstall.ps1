$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$legacy = Join-Path $content 'cloc-*.exe'
$target = Join-Path $content 'cloc.exe'

New-Item -Path $content -Type 'Directory' -Force | Out-Null

# Remove legacy executables (from before we renamed the web file)
Remove-Item -Path $legacy -Force | Out-Null

Get-ChocolateyWebFile `
    -PackageName 'cloc' `
    -Url 'https://github.com/AlDanial/cloc/releases/download/v1.68/cloc-1.68.exe' `
    -Checksum 'C484FC58615FC3B0D5569B9063EC1532980281C3155E4A19099B11EF1C24443B' `
    -ChecksumType 'SHA256' `
    -FileFullPath $target
