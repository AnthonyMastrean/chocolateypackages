param([string]$name)

git checkout -b $name

Copy-Item "_template" "$name" -recurse
Start-Sleep -seconds 3

Push-Location "$name"

Get-Content "__NAME__.nuspec" `
  | %{ $_ -replace "__NAME__","$name" } `
  | Set-Content "__NAME__.nuspec"

Rename-Item "$template" "$name.nuspec"
Start-Sleep -seconds 1

git add .
git commit -am "created new package: $name"
git push origin "$name"

Pop-Location 