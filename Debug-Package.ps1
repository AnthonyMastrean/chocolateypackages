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

function Test-NullPath($path) {
    if($path -eq $null) {
        return $false
    }
    
    return (Test-Path $path)
}

$nuspec  = Resolve-Path *.nuspec
$nupkg   = Resolve-Path *.nupkg
$xml     = [xml] (Get-Content $nuspec)

$id      = $xml.package.metadata.id
$version = $xml.package.metadata.version

$temp    = Join-Path $ENV:TEMP "chocolatey\$id"

'##################################################'
"Debugging package: $id.$version"
'##################################################'

Clear-Host

if(Test-NullPath $nupkg) { Remove-Item $nupkg }
if(Test-NullPath $temp)  { Remove-Item $temp -recurse -force }

nuget pack $nuspec

cinst $id -source $pwd -force