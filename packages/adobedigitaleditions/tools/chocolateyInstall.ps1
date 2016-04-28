# This key is supposed to suppress the Norton install dialog.
#
#   https://support.muse.adobe.com/thread/1976740?start=0&tstart=0
#
New-Item -Force -Path 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\N360' | Out-Null
New-Item -Force -Path 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\N360' | Out-Null

Install-ChocolateyPackage `
    -PackageName 'adobedigitaleditions' `
    -FileType 'EXE' `
    -SilentArgs '/S' `
    -Url 'https://adedownload.adobe.com/pub/adobe/digitaleditions/ADE_4.5_Installer.exe' `
    -Checksum 'c56bf9034f2390e149859f5bb6472afd'
