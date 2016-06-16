$tools = Split-Path -Parent $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

$setup = Join-Path $content 'sikulixsetup-1.1.0.jar'
$sikuli = Join-Path $content 'runsikulix.cmd'
$shortcut = Join-Path ([System.Environment]::GetFolderPath('CommonPrograms')) 'SikuliX.lnk'
$icon = Join-Path $tools 'sikulix.ico'

New-Item -Type 'Directory' -Force -Path $content | Out-Null

# The installer is an executable JAR, which explodes application files where-
# ever it's executed, which explains the push/pop-location later.
#
Get-ChocolateyWebFile `
    -PackageName 'sikulix' `
    -Url 'https://launchpad.net/sikuli/sikulix/1.1.0/+download/sikulixsetup-1.1.0.jar' `
    -Checksum 'D538518BED208E64763B2B7579893858BD85332B07097EF3C5B69B1C22AFEEF2' `
    -ChecksumType 'SHA256' `
    -FileFullPath $setup

# We really need to find java.exe on the PATH, especially if it's installed,
# for the first time, as a dependency of this package.
#
Update-SessionEnvironment

Push-Location $content

Install-ChocolateyInstallPackage `
    -PackageName 'sikulix' `
    -FileType 'EXE' `
    -SilentArgs "-jar $setup options 1.1 1.2 2" `
    -File 'java'

Pop-Location

Install-ChocolateyShortcut `
    -ShortcutFilePath $shortcut `
    -TargetPath $sikuli `
    -WorkingDirectory $content `
    -IconLocation $icon
