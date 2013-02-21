# TODO: support choosing an mspec version?

$mspec = @(Resolve-Path "$pwd\packages\Machine.Specifications.*") | Sort-Object | Select-Last 1
$tools = Join-Path $mspec 'tools'

# TODO: find your installed resharper version by default
# TODO: support choosing a resharper version?

$bat   = @(Resolve-Path "$tools\InstallResharperRunner.*.bat") | Sort-Object | Select-Last 1

& $bat