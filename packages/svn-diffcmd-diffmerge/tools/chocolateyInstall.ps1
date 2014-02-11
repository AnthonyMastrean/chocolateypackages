$name    = "svn-diffcmd-diffmerge"

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

$diff    = Join-Path $content "diff.bat"
$diff3   = Join-Path $content "diff3.bat"
$merge   = Join-Path $content "merge.bat"

$config  = Join-Path (Resolve-Path ~) ".subversion\config"

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
