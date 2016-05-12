$tools = Split-Path -parent $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$target = Join-Path $content 'pngout.exe'

Get-ChocolateyWebFile `
    -PackageName 'pngout' `
    -Url 'http://advsys.net/ken/util/pngout.exe' `
    -Checksum '843F0BE42E86680C1663C4EF58EB0677ACE15FC29AB23897C83F4B7E5AF3EF36' `
    -ChecksumType 'SHA256' `
    -FileFullPath $target
