<#
    .SYNOPSIS
    Create a new chocolatey package from the template.
    
    .DESCRIPTION
    Copy the template to a new location, by package ID. Replace all 
    the '__NAME__' tokens. Commit the new files and push.
    
    .PARAMETER id
    The id of this package.
    
    .EXAMPLE
    .\New-Package.ps1 diffmerge
    
    Create a new package 'diffmerge' from the template.
#>
param([string]$id)

function Replace-Token {
  param([string]$token, [string]$replacement, [Parameter(ValueFromPipeline = $true)][string]$path)
  (Get-Content $path) | %{ $_ -replace $token, $replacement } | Set-Content $path
}

Copy-Item '_template' $id -Recurse
Push-Location $id
Rename-Item '__NAME__.nuspec' "$id.nuspec"
Get-ChildItem | Replace-Token '__NAME__' $id

git add -A
git commit -am "new package: $id"
git push
