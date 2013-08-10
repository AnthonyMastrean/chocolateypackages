function Pack-ChocolateyPackage {
  <#
    .SYNOPSIS
    Build the Chocolatey package.
    
    .DESCRIPTION
    Build the Chocolatey package that is defined by the nuspec in the
    working directory. Leans heavily on the cpack command.
    
    .EXAMPLE
    PS> Pack-ChocolateyPackage
  #>

  $xml    = Get-PackageMetadata
  $id     = $xml.package.metadata.id
  $nuspec = Join-Path $pwd "$id.nuspec"

  cpack $nuspec
}