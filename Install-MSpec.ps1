function Get-LatestItem([string]$path) { 
  $item = @(Resolve-Path $path) | Sort-Object | Select-Last 1  
  if(-not(Test-Path $path)) {
    throw "path not found: $path"
  }
  
  $item
}

# TODO: support choosing an mspec version?
# TODO: find your installed resharper version by default
# TODO: support choosing a resharper version?

$mspec = Get-LatestItem -Path 'packages\Machine.Specifications.*'
$bat   = Get-LatestItem -Path (Join-Path $mspec 'tools\InstallResharperRunner.*.bat')

& $bat