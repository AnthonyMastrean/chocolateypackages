$name   = "svn-diffcmd-diffmerge"
$tools  = Split-Path $MyInvocation.MyCommand.Definition
$diff   = Join-Path $tools "diff.bat"
$merge  = Join-Path $tools "merge.bat"
$config = Join-Path (Resolve-Path ~) ".subversion\config"

try {
  (Get-Content $config) `
    | %{ $_ -replace "^\s*#*\s*diff-cmd\s*=.*$", "diff-cmd = `"$diff`"" } `
    | %{ $_ -replace "^\s*#*\s*merge-tool-cmd\s*=.*$", "merge-tool-cmd = `"$merge`"" } `
    | Set-Content $config
  
  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  throw 
}
