function Install-ChocolateyPackage {
  <#
    .SYNOPSIS
    Install the Chocolatey package.
    
    .DESCRIPTION
    Install the Chocolatey package that has already been built from 
    a nuspec in the working directory. Leans on the nuspec metadata
    and cinst with a source of "$pwd".
    
    .EXAMPLE
    PS> Install-ChocolateyPackage
  #>

  $xml     = Get-PackageMetadata
  $id      = $xml.package.metadata.id
  $version = $xml.package.metadata.version
  
  cinst $id -source $pwd -version $version -force
}
