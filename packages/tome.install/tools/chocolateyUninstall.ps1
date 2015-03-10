$id = "tome"
$name = "Tales of Maj'Eyal"

$shortcut = Join-Path [System.Environment]::GetFolderPath("Desktop") "$name.lnk"
$startmenu = Join-Path [System.Environment]::GetFolderPath("CommonPrograms") "T-Engine4"
$programfiles = Join-Path (@{64="${ENV:ProgramFiles(X86)}";32="$ENV:ProgramFiles"}[(Get-ProcessorBits)]) "ToME"

try {
  if(Test-Path $shortcut) {
    Remove-Item $shortcut -Recurse -Force
  }

  if(Test-Path $startmenu) {
    Remove-Item $startmenu -Recurse -Force
  }

  if(-not(Test-Path $programfiles)) {
    Write-Host @"
Chocolatey cannot find the program files for this package. You may have 
installed these to another location and will have to delete them manually.

  Not Found: '$programfiles'
"@
  }

  if(Test-Path $programfiles) {
    Remove-Item $programfiles -Recurse -Force
  }

  Write-ChocolateySuccess $id
} catch {
  Write-ChocolateyFailure $id $_.Exception.Message
  throw
}
