$name = 'greenfish.iconeditor'
$url  = 'http://people.inf.elte.hu/szbqact/greenfish/gfie_setup_3.1.zip'

try { 
    $tools  = Split-Path $MyInvocation.MyCommand.Definition
    $target = Join-Path $tools 'gfie_setup_3.1.exe'

    Install-ChocolateyZipPackage $name $url $tools
    Install-ChocolateyInstallPackage $name 'EXE' '/SILENT' $target

    Write-ChocolateySuccess $name
} 
catch {
    Write-ChocolateyFailure $name $($_.Exception.Message)
    throw 
}
