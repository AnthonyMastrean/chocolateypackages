function Reset-ChocolateyPackage { 
  <#
    .SYNOPSIS
    Removes all traces of the Chocolatey package.
    
    .DESCRIPTION
    Removes all traces of the Chocolatey package defined in this working
    directory. That includes any downloaded files in the %TEMP% directory, 
    the package built in this directory, and the package directory in the 
    Chocolatey lib.
    
    .EXAMPLE
    PS> Reset-ChocolateyPackage
  #>
  
  $xml     = Get-PackageMetadata
  $id      = $xml.package.metadata.id
  $version = $xml.package.metadata.version

  $nupkg   = $id.$version.nupkg
  $temp    = Join-Path $ENV:TEMP (Join-Path 'Chocolatey' $id)
  $lib     = Join-Path $ENV:ChocolateyInstall (Join-Path 'lib' $id.$version)

  @($nupkg, $temp, $lib) | %{
    if(Test-NullPath $_) {  
      Remove-Item $_ -Force -Recurse
    }
  }
}