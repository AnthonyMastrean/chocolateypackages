$id     = "wudt"
$url    = "https://download-codeplex.sec.s-msft.com/Download/Release?ProjectName=wudt&DownloadId=96313&FileTime=129048694816630000&Build=20959"
$kind   = "MSI"
$silent = "/QN"

$tools  = Split-Path $MyInvocation.MyCommand.Definition
$exe    = Join-Path $tools "wudt.exe"
$msi    = Join-Path $tools "wudt.msi"

. $tools\bins.ps1

# This installer is not silent and doesn't respect it's own flags. It is,
# however, a self-extracting CAB. We can extract and install the MSI.

    # ---------------------------
    # Microsoft ISO Backup Tool
    # ---------------------------
    # Command line options:

    # /Q -- Quiet modes for package,

    # /T:<full path> -- Specifies temporary working folder,

    # /C -- Extract files only to the folder when used also with /T.

    # /C:<Cmd> -- Override Install Command defined by author.

    # ---------------------------
    # OK
    # ---------------------------

# Install-ChocolateyPackage -PackageName $id -FileType $kind -SilentArgs $silent -Url $url

Get-ChocolateyWebFile -PackageName $id -FileFullPath $exe -Url $url

& $exe /Q /T:"$tools" /C

New-IgnoreBin -Path $exe

Install-ChocolateyInstallPackage -PackageName $id -FileType $kind -Silent $silent -File $msi
