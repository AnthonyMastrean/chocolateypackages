function Get-LatestItem([string]$path) { 
  $item = @(Resolve-Path $path) | Sort-Object | Select-Last 1  
  if(-not(Test-Path $path)) {
    throw "path not found: $path"
  }
  
  $item
}

# TODO: support choosing an mspec version?
# TODO: support choosing a resharper version?

$rsh   = Get-LatestItem -Path 'C:\Program Files (x86)\JetBrains\ReSharper\v*'
$vers  = ($rsh -split '\\' | Select-Object -Last 1 ) -split 'v' | Select-Object -Last 1
$mspec = Get-LatestItem -Path 'packages\Machine.Specifications.*'
$bat   = Get-LatestItem -Path (Join-Path $mspec "tools\InstallResharperRunner.$vers.bat")

& $bat