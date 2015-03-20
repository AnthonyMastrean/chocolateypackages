<#
  .SYNOPSIS

  Get the uninstaller location for most Windows software.

  .DESCRIPTION

  This function finds the correct uninstaller given just an application name.
  Find the name from the Programs and Features Control Panel window.

  .PARAMETER Name

  The name or partial name of the application.

  .EXAMPLE

  $tools = Split-Path $MyInvocation.MyCommand.Definition
  . $tools\uninstall.ps1

  Uninstall-ChocolateyPackage 'foo' 'EXE' '/S' (Get-Uninstaller -Name 'Foo')

  .LINK

  https://github.com/AnthonyMastrean/chocolateypackages/blob/master/helpers/uninstall.ps1
#>
function Get-Uninstaller {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string] $Name
  )

  $local_key     = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*'
  $machine_key32 = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\*'
  $machine_key64 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*'

  $keys = @($local_key, $machine_key32, $machine_key64)

  Get-ItemProperty -Path $keys | ?{ $_.DisplayName -match $Name } | Select-Object -ExpandProperty UninstallString
}
