<#
    .SYNOPSIS
    Debug a chocolatey package.
    
    .DESCRIPTION
    This script will debug the current package. It expects that you 
    are in the package directory. For example
    
        PS\nugetpackages\dependencywalker\>

    The script will force remove any existing chocolatey package by
    the same name in your CHOCOLATEYINSTALL directory. It will 
    recreate the nuget package and invoke 'cinst' on the same in this 
    directory.
    
    .EXAMPLE
    ..\Debug-Package.ps1
    
    Invoke the debug script (located in the root directory) from in 
    this package directory.
#>

Clear-Host

$nuspec  = Resolve-Path *.nuspec
$xml     = [xml] (Get-Content $nuspec)

$id      = $xml.package.metadata.id
$version = $xml.package.metadata.version
$package = "$id.$version"

$install = Join-Path $ENV:CHOCOLATEYINSTALL "lib\$package"

'##################################################'
"Debugging package: $id"
'##################################################'

if(Test-Path $install) {
    Remove-Item $install -Recurse -Force
}

nuget pack $nuspec
cinst $id -source $pwd