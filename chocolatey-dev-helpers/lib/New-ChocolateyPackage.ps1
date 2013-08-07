function New-ChocolateyPackage {
  <#
      .SYNOPSIS
      Create a new Chocolatey package skeleton from the template.

      .PARAMETER id
      The ID of the new package.
      
      .EXAMPLE
      PS> New-ChocolateyPackage diffmerge
  #>
  param(
    [Parameter(Mandatory = $true)]
    [string]$id
  )

  Copy-Item (Join-Path $module_root 'template') .\$id -Force -Recurse
  
  Move-Item .\$id\*.nuspec .\$id\$id.nuspec
  
  Get-ChildItem .\$id -Recurse | Select-Object -Expand FullName | Replace-Token '__NAME__' $id
  Get-ChildItem .\$id -Recurse | Select-Object -Expand FullName | Replace-Token '__OWNER__' $ENV:USERNAME
  
  Push-Location .\$id
}