param($PackageName, [switch]$Force32)

$here = Split-Path $MyInvocation.MyCommand.Definition
$source = Join-Path $here 'bin'

Import-Module $ENV:CHOCOLATEYINSTALL\helpers\chocolateyInstaller.psm1

if ($Force32) {
    choco install --force --yes --source "$source;http://chocolatey.org/api/v2/" $PackageName --x86
} else {
    choco install --force --yes --source "$source;http://chocolatey.org/api/v2/" $PackageName
}
