$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$target = Join-Path $content 'underscore.exe'

$shortcutdir = @{$true='CommonStartup';$false='Startup'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'Underscore Mode.lnk'

Get-ChocolateyWebFile `
    -PackageName'underscore' `
    -Url 'https://github.com/AnthonyMastrean/autohotkey/releases/download/20150826/underscore.exe' `
    -Checksum '75A59709AE4042B9C61D6C71671F7226C50A5B9DAF4F3161FA75239BE9B7486E' `
    -ChecksumType 'SHA256' `
    -FileFullPath $target

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $target

& $shortcut
