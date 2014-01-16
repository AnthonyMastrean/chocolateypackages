function Get-LatestItem([string]$path) { 
  $item = @(Resolve-Path $path) | Sort-Object | Select-Object -Last 1  
  if(-not(Test-Path $path)) {
    throw "path not found: $path"
  }
  
  $item
}

$rsh   = Get-LatestItem -Path 'C:\Program Files (x86)\JetBrains\ReSharper\v*'
$vers  = ($rsh -split '\\' | Select-Object -Last 1 ) -split 'v' | Select-Object -Last 1
$mspec = Get-LatestItem -Path 'packages\Machine.Specifications.*'

# The mspec integration batch file does not use %~dp0 to ensure success
# from any command prompt/working directory, which requires execution from 
# the containing directory.
Push-Location "$mspec\tools"
$bat   = Get-LatestItem -Path "InstallResharperRunner.$vers.bat"
Pop-Location

# The batch file also uses a hardcoded PAUSE, so this requires user 
# interaction to continue and end the script :(
& $bat