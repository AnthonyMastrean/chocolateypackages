$name     = "hggit"
$url      = "https://bitbucket.org/durin42/hg-git"
$bin_root = Join-Path $ENV:SYSTEMDRIVE $ENV:CHOCOLATEY_BIN_ROOT
$hggit    = Join-Path $bin_root "hg-git"

try {
  hg clone $url $hggit
  
  Write-Host @"
Add the following lines to your .hg\hgrc or ~\.hgrc file
 
[extensions]
bookmarks = 
hggit = $hggit\hggit

"@

  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw 
}
