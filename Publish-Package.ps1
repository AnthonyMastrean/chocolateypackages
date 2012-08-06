param([switch]$createOnly)

$nuspec  = Resolve-Path *.nuspec
$xml     = [xml] (Get-Content $nuspec)
$id      = $xml.package.metadata.id
$version = $xml.package.metadata.version

git tag -a "$id.$version" -m "Publishing $id.$version"
git push --tags

$package = Resolve-Path *.nupkg

nuget push $package -source 'http://chocolatey.org/' "$(if($createOnly) { '-CreateOnly' })"