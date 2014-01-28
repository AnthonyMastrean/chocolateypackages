function New-ChocolateyPackage {
  <#
    .SYNOPSIS
    Create a new Chocolatey package.

    .DESCRIPTION
    Create a new Chocolatey package from the skeleton in the template 
    directory. Create the named folder, rename the nuspec, and replace
    basic tokens in the scripts.

    .PARAMETER id
    The ID of the package to create.
    
    .EXAMPLE
    PS> New-ChocolateyPackage diffmerge
  #>
  param(
    [Parameter(Mandatory = $true)]
    [string]$id
  )

  $template = Join-Path $pwd "template"
  $package  = Join-Path (Join-Path $pwd "packages") $id
  $wildcard = Join-Path $package "*.nuspec"
  $nuspec   = Join-Path $package "$id.nuspec"

  Copy-Item $template $package -Force -Recurse
  
  Move-Item $wildcard $nuspec
  
  Get-ChildItem $package -Recurse | Select-Object -Expand FullName | Replace-Token "__NAME__" $id
  Get-ChildItem $package -Recurse | Select-Object -Expand FullName | Replace-Token "__OWNER__" $ENV:USERNAME
  
  Push-Location $package
}