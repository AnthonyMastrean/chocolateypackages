$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$bin = Join-Path $content 'cloc-1.66.exe'

. $tools\bins.ps1

New-Item -Type 'Directory' -Path $content -Force | Out-Null

Get-ChocolateyWebFile `
    -PackageName 'cloc' `
    -Url 'https://github.com/AlDanial/cloc/releases/download/v1.66/cloc-1.66.exe' `
    -Checksum '54D6662E59B04BE793DD10FA5E5EDF7747CF0C0CC32F71EB67A3CF8E7A171D81' `
    -ChecksumType 'SHA256' `
    -FileFullPath $bin

Install-IgnoreBin `
    -Path $bin

Install-BinFile `
    -Name 'cloc' `
    -Path $bin
