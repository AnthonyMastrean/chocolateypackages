function Test-ChocolateyPackage {
<#
    .SYNOPSIS
    Tests a Chocolatey package.
    
    .DESCRIPTION
    This script will debug the current package. It expects that you 
    are in the package directory. For example
    
        PS\dependencywalker>

    The script will force remove any existing chocolatey package by
    the same name in your CHOCOLATEYINSTALL directory. It will 
    recreate the nuget package and invoke 'cinst' on the same in this 
    directory.
    
    .EXAMPLE
    .\Test-ChocolateyPackage.ps1
    
    Invoke the debug script (located in the root directory) from in 
    this package directory.
#>

  $nuspec  = Resolve-Path *.nuspec
  $nupkg   = Resolve-Path *.nupkg
  $xml     = [xml] (Get-Content $nuspec)

  $id      = $xml.package.metadata.id
  $version = $xml.package.metadata.version

  $temp    = Join-Path $ENV:TEMP "chocolatey\$id"
  $lib     = Join-Path $ENV:ChocolateyInstall "lib\$id.$version"

  '##################################################'
  "Debugging package: $id.$version"
  '##################################################'

  Clear-Host

  if(Test-NullPath $nupkg) { Remove-Item $nupkg }
  if(Test-NullPath $temp)  { Remove-Item $temp -recurse -force }
  if(Test-NullPath $lib)   { Remove-Item $lib -recurse -force }

  cpack $nuspec
  cinst $id -source $pwd -force
}
