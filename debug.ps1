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
    ..\debug.ps1
    
    Invoke the debug script (located in the root directory) from in 
    this package directory.
#>

Clear-Host
$name = Split-Path $pwd -leaf
Remove-Item "$ENV:CHOCOLATEYINSTALL\lib\$name*" -force -recurse
nuget pack "$name.nuspec"
cinst "$name" -source "$pwd"