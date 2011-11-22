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

function Replace-Token([string]$token, [string]$replacement, [Parameter(ValueFromPipeline = $true)][string]$path)
{
    (Get-Content $path) `
        | %{ $_ -replace $token,$replacement } `
        | Set-Content $path
}

git checkout -b $name

Copy-Item "_template" "$name" -recurse

Push-Location "$name"

Rename-Item "__NAME__.nuspec" "$name.nuspec"

"$name.nuspec" | Replace-Token "__NAME__" "$name"
"tools\chocolateyInstall.ps1" | Replace-Token "__NAME__" "$name"

git add .
git commit -am "created new package from template: $name"
git push origin "$name"