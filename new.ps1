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