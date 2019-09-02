$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$legacy = Join-Path $content 'cloc-*.exe'
$target = Join-Path $content 'cloc.exe'

New-Item -Path $content -Type 'Directory' -Force | Out-Null

# Remove legacy executables (from before we renamed the web file)
Remove-Item -Path $legacy -Force | Out-Null

Get-ChocolateyWebFile `
    -PackageName 'cloc' `
    -Url 'https://github.com/AlDanial/cloc/releases/download/1.82/cloc-1.82.exe' `
    -Checksum '2E5FB443FDEFD776D7B6B136A25E5EE2048991E735042897DBD0BF92EFB16563' `
    -ChecksumType 'SHA256' `
    -FileFullPath $target
