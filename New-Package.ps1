<#
    .SYNOPSIS
    Create a new chocolatey package from the template.
    
    .DESCRIPTION
    Create a new chocolatey package from the template. First, check
    out a new branch. Then, replace all the '__NAME__' tokens. And, 
    finally, commit the new files and push the branch to 'origin'.
    
    .PARAMETER name
    The name of this package. It will be used to create the branch,
    folder name, and to otherwise replace all the '__NAME__' tokens.
    
    .EXAMPLE
    .\New-Package.ps1 diffmerge
    
    Create a new branch/package 'diffmerge' from the template.
#>

param([string]$name)

git checkout -b $name

Copy-Item "_template" "$name" -recurse

Push-Location "$name"

Rename-Item "__NAME__.nuspec" "$name.nuspec"

(Get-Content "$name.nuspec") `
  | %{ $_ -replace "__NAME__","$name" } `
  | Set-Content "$name.nuspec"

git add .
git commit -am "created new package from template: $name"
git push origin "$name"

Pop-Location 