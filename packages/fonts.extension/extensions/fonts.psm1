$ScriptRoot = Split-Path -Path $MyInvocation.MyCommand.Definition

. $ScriptRoot/fonts.ps1

Export-ModuleMember -Function Add-Font, Remove-Font
