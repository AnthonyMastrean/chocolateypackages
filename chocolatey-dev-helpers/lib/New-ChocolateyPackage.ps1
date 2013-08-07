function New-ChocolateyPackage {
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

  Copy-Item '_template' $id -Recurse
  Push-Location $id
  Rename-Item '__NAME__.nuspec' "$id.nuspec"
  Get-ChildItem | Replace-Token '__NAME__' $id

  git add -A
  git commit -am "new package: $id"
  git push
}