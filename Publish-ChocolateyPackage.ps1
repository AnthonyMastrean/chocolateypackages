function Publish-ChocolateyPackage {
  $nuspec  = Resolve-Path *.nuspec
  $xml     = [xml] (Get-Content $nuspec)
  $id      = $xml.package.metadata.id
  $version = $xml.package.metadata.version

  git add .
  git add -u
  git commit -am "Publishing $id.$version"
  git tag -a "$id.$version" -m "Publishing $id.$version"
  git push --tags

  $package = Resolve-Path *.nupkg

  cpush $package
}
