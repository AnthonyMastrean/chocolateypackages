param([switch]$createOnly)

$nuspec  = Resolve-Path *.nuspec
$xml     = [xml] (Get-Content $nuspec)
$version = $xml.package.metadata.version

git tag -a "v$version" -m "Publishing version: $version"

$package = Resolve-Path *.nupkg

nuget push $package -source 'http://chocolatey.org/' "$(if($createOnly) { '-CreateOnly' })"