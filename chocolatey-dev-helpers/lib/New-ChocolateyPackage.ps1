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

  $here = Join-Path $pwd $id

  Copy-Item (Join-Path $module_root 'template') $here -Force -Recurse
  
  Move-Item $here\*.nuspec $here\$id.nuspec
  
  Get-ChildItem $here -Recurse | Select-Object -Expand FullName | Replace-Token '__NAME__' $id
  Get-ChildItem $here -Recurse | Select-Object -Expand FullName | Replace-Token '__OWNER__' $ENV:USERNAME
  
  Push-Location $here
}