function Write-ChocolateyPackage {
  <#
    .SYNOPSIS
    Build the Chocolatey package from the spec.
    
    .DESCRIPTION
    Build the Chocolatey package that is defined by the nuspec in the
    working directory. Leans heavily on the cpack command.
    
    .EXAMPLE
    PS> Write-ChocolateyPackage
  #>

  $xml    = Get-PackageMetadata
  $id     = $xml.package.metadata.id
  $nuspec = Join-Path $pwd "$id.nuspec"

  cpack $nuspec
}