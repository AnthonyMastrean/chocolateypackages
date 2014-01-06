# no MSDN license here
cinst VisualStudio2012WDX
cinst VisualStudioExpress2012Web
cinst VisualStudioExpress2012Windows8
cinst IHateRegions
cinst IndentGuides
cinst NugetPackageManager
cinst PerfWatsonMonitor
cinst VSColorOutput

Push-Location (Join-Path (Split-Path $profile) "Modules")
git clone "git@github.com:AnthonyMastrean/Posh-VsVars.git"
Pop-Location
