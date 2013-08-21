$name   = 'hggit'

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'

try {
  # hg clone https://bitbucket.org/durin42/hg-git $ENV:CHOCOLATEY_BIN_ROOT
  # Write-Host @"
  # Add the following lines to your .hg\hgrc or ~\.hgrc file
  # 
  # [extensions]
  # bookmarks = 
  # hggit = $ENV:CHOCOLATEY_BIN_ROOT\hg-git\hggit
  #
  # @"

  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw 
}
