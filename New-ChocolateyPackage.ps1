<#
    .SYNOPSIS
    Create a new Chocolatey package from the template.
    
    .DESCRIPTION
    Copy the template to a new location, by package ID. Replace all 
    the '__NAME__' tokens. Commit the new files and push.
    
    .PARAMETER id
    The id of this package.
    
    .EXAMPLE
    .\New-ChocolateyPackage.ps1 diffmerge
    
    Create a new package 'diffmerge' from the template.
#>
param([string]$id)

function Replace-Token {
  param([string]$token, [string]$replacement, [Parameter(ValueFromPipeline = $true)][string]$path)
  (Get-Content $path) | %{ $_ -replace $token, $replacement } | Set-Content $path
}

function Test-NullPath($path) {
    if($path -eq $null) { return $false }
    return (Test-Path $path)
}

Copy-Item '_template' $id -Recurse
Push-Location $id
Rename-Item '__NAME__.nuspec' "$id.nuspec"
Get-ChildItem | Replace-Token '__NAME__' $id

git add -A
git commit -am "new package: $id"
git push

function Debug-ChocolateyPackage {
<#
    .SYNOPSIS
    Debug a Chocolatey package.
    
    .DESCRIPTION
    This script will debug the current package. It expects that you 
    are in the package directory. For example
    
        PS\dependencywalker>

    The script will force remove any existing chocolatey package by
    the same name in your CHOCOLATEYINSTALL directory. It will 
    recreate the nuget package and invoke 'cinst' on the same in this 
    directory.
    
    .EXAMPLE
    .\Debug-ChocolateyPackage.ps1
    
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

function Publish-ChocolateyPackage {
  param([switch]$createOnly)

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

  cpush $package "$(if($createOnly) { '-CreateOnly' })"
}
