param([string]$name)

git checkout -b $name

Copy-Item "_template" "$name" -recurse

Push-Location "$name"

$nuspec = "$name.nuspec"

Rename-Item "__NAME__.nuspec" "$nuspec"
Start-Sleep -seconds 1
Get-Content "$nuspec" `
  | %{ $_ -replace "__NAME__","$name" } `
  | Set-Content "$nuspec"

git add .
git commit -am "created new package: $name"
git push origin "$name"

Pop-Location 