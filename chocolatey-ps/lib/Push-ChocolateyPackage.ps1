function Push-ChocolateyPackage {
  <#
    .SYNOPSIS
    Push the Chocolatey package.
    
    .DESCRIPTION
    Push the Chocolatey package that has been built in this working 
    directory. This function integrates with git and will resolve all
    changes, commit, tag, and push.
    
    .EXAMPLE
    PS> Push-ChocolateyPackage
  #>

  $xml     = Get-PackageMetadata
  $id      = $xml.package.metadata.id
  $version = $xml.package.metadata.version
  $nupkg   = Join-Path $pwd "$id.$version.nupkg"

  git add .
  git add -u
  git commit -am "Publishing $id.$version"
  git tag -a "$id.$version" -m "Publishing $id.$version"
  git push --tags

  cpush $nupkg
}
