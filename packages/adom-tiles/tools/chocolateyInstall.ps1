$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$target = Join-Path $package 'adom\adom.exe'

$shortcutdir = @{$true='CommonPrograms';$false='Programs'}[($PSVersionTable.PSVersion -gt '2.0.0.0')]
$shortcut = Join-Path ([System.Environment]::GetFolderPath($shortcutdir)) 'ADOM (Tiles).lnk'

# PowerShell [3.0,)
# $url = (Invoke-WebRequest -Uri 'http://www.indiedb.com/downloads/start/89176').Links `
#     | ?{ $_.innerHTML -eq 'download adom_noteye_windows_r60_pub.1.zip' } `
#     | %{ "http://www.indiedb.com$($_.href)" }

# PowerShell [2.0,)
$request = [System.Net.WebRequest]::Create('http://www.indiedb.com/downloads/start/89176')
$response = $request.GetResponse()
$stream = $response.GetResponseStream()
$reader = New-Object 'System.IO.StreamReader' $stream
$body = $reader.ReadToEnd()
$body -match '<a href="(.*)">download adom_noteye_windows_r60_pub.1.zip</a>' | Out-Null
$url = "http://www.indiedb.com$($matches[1])"

Install-ChocolateyZipPackage `
    -PackageName 'adom-tiles' `
    -Url $url `
    -Checksum '0CF75B6C1BD0DF5EC7727639E2E07029DB5C4E7AE2C79B5DD7EC40AC32BE9686' `
    -ChecksumType 'SHA256' `
    -UnzipLocation $package

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -WorkingDirectory $workdir `
    -TargetPath $target

New-Item -Type 'File' -Path "$target.ignore" -Force | Out-Null
