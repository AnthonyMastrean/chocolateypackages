param($PackageName)

$here = Split-Path $MyInvocation.MyCommand.Definition
$source = Join-Path $here 'bin'

Import-Module $ENV:CHOCOLATEYINSTALL\helpers\chocolateyInstaller.psm1

choco upgrade --force --yes --pre --source "$source;http://chocolatey.org/api/v2/" $PackageName
