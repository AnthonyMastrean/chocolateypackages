<#
  .SYNOPSIS

  Get the uninstaller location for most Windows software.

  .DESCRIPTION

  This function finds the correct uninstaller given just an application name.
  Find the name from the Programs and Features Control Panel window.

  .PARAMETER Name

  The name or partial name of the application.

  .PARAMETER Architecture

  The processor architecture of the target system.

  This can usually be left out, as this function should be called within the
  context of a Chocolatey command, it will use the loaded and internal function,
  Get-ProcessorBits.

  .PARAMETER Local

  Despite Chocolatey's intent to be a machine-wide package manager, some
  applications install for just the current user. Provide this switch to search
  for uninstallers in the user's registry.

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
    [string] $Name,

    [ValidateNotNullOrEmpty()]
    [int] $Architecture = (Get-ProcessorBits),

    [switch] $Local
  )

  $local_key = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Uninstall\'

  $machine_key32 = 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\'
  $machine_key64 = 'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\'
  $machine_key   = @{64=$machine_key64;32=$machine_key32}[$Architecture]

  $key = @{$true=$local_key;$false=$machine_key}[$Local]

  Write-Debug "[Get-Uninstaller] Searching registry key: $key"

  $uninstaller = Get-ChildItem $key | %{ Get-ItemProperty $_.PSPath } | ?{ $_.DisplayName -match $Name }
  $uninstaller.UninstallString
}
