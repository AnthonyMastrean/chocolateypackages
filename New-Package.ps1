<#
    .SYNOPSIS
    Create a new chocolatey package from the template.
    
    .DESCRIPTION
    Create a new chocolatey package from the template. First, check
    out a new branch. Then, replace all the '__NAME__' tokens. And, 
    finally, commit the new files and push the branch to 'origin'.
    
    .PARAMETER id
    The id of this package. It will be used to create the branch,
    folder id, and to otherwise replace all the '__NAME__' tokens.
    
    .EXAMPLE
    .\New-Package.ps1 diffmerge
    
    Create a new branch/package 'diffmerge' from the template.
#>

param([string]$id)

function Replace-Token {
  param(
    [string]$token,     
    [string]$replacement, 
    [Parameter(ValueFromPipeline = $true)]
    [string]$path
  )

  (Get-Content $path) `
    | %{ $_ -replace $token,$replacement } `
    | Set-Content $path
}

git checkout -b $id

Copy-Item '_template' $id -Recurse
Push-Location $id
Rename-Item '__NAME__.nuspec' "$id.nuspec"
Get-ChildItem | Replace-Token '__NAME__' $id

git add -A
git commit -am "new package: $id"
git push origin $id