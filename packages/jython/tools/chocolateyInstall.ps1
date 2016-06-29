$tools = Split-Path -Parent $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

$setup = Join-Path $content 'jython-installer-2.7.0.jar'

New-Item -Type 'Directory' -Force -Path $content | Out-Null

# The installer is an executable JAR, which explodes application files where-
# ever it's executed, which explains the push/pop-location later.
#
Get-ChocolateyWebFile `
    -PackageName 'jython' `
    -Url 'http://search.maven.org/remotecontent?filepath=org/python/jython-installer/2.7.0/jython-installer-2.7.0.jar' `
    -Checksum 'b08d73b5df7d95e35e7b8dcaf1558025cf24f0f1' `
    -ChecksumType 'SHA1' `
    -FileFullPath $setup

# We really need to find java.exe on the PATH, especially if it's installed,
# for the first time, as a dependency of this package.
#
Update-SessionEnvironment

Push-Location $content

Install-ChocolateyInstallPackage `
    -PackageName 'sikulix' `
    -FileType 'EXE' `
    -SilentArgs "-jar $setup -s -d C:\jython2.7 -t standard" `
    -File 'java'

Pop-Location
