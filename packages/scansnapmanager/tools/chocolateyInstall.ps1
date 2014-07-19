$id = "scansnapmanager"
$url = "http://www.fujitsu.com/downloads/IMAGE/driver/ss/mgr/w-s1300/ssv51l30W.exe"
$kind = "EXE"

$temp = Join-Path $ENV:TEMP (Join-Path "Chocolatey" $id)
$setup = Join-Path $temp "Manager\setup.exe"

New-Item $temp -Type Directory -Force | Out-Null
Push-Location $temp

Install-ChocolateyPackage -PackageName $id -FileType $kind -Url $url

Pop-Location

$tools = Split-Path $MyInvocation.MyCommand.Definition
$response = Join-Path $tools "Setup.iss"

$silent = "/S /f1`"$response`""

Install-ChocolateyInstallPackage -PackageName $id -FileType $kind -SilentArgs $silent -File $setup
