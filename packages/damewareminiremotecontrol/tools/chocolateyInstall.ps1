$tools = Split-Path $MyInvocation.MyCommand.Definition
$package = Split-Path $tools
$content = Join-Path $package 'content'
$exe32 = Join-Path $content 'DameWareMRC32-St.exe'
$exe64 = Join-Path $content 'DameWareMRC64-St.exe'
$exe = @{32=$exe32;64=$exe64}[(Get-ProcessorBits)]

Install-ChocolateyZipPackage `
    -PackageName 'damewareminiremotecontrol' `
    -Url 'http://downloads.solarwinds.com/solarwinds/Release/DameWare/v12.0.4/DameWareMRC32-St-v12.0.4-Eval.zip' `
    -Checksum '12A88E6A756BCDB26CAC778C406BF308FB1C63E020B01E90022FFC74093FE7E9' `
    -ChecksumType 'SHA256' `
    -Url64 'http://downloads.solarwinds.com/solarwinds/Release/DameWare/v12.0.4/DameWareMRC64-St-v12.0.4-Eval.zip' `
    -Checksum64 '0200DD4D2966E26B4CB10416EA08987FBEBEEE0D72E73B64B5DA0C9818A13B23' `
    -ChecksumType64 'SHA256' `
    -UnzipLocation $content

Install-ChocolateyInstallPackage `
    -PackageName 'damewareminiremotecontrol' `
    -FileType 'EXE' `
    -SilentArgs '/S' `
    -File $exe
