# Remove the custom shims
Get-ChildItem $tools\*.bat `
  | Split-Path -Leaf `
  | %{ $_ -replace ".bat", ".exe" } `
  | %{ Join-Path $ENV:chocolateyInstall "bin\$_" } `
  | ?{ Test-Path $_ } `
  | Remove-Item -Force
