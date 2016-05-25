<#
  .SYNOPSIS

  Get the uninstaller EXE location for a Nullsoft installer.

  .DESCRIPTION

  Nullsoft installers do not participate in all the niceties of the MSI system.
  Nor does the 64-bit Windows registry make it any easier. This function can
  find the correct uninstaller EXE given just an application name or partial
  name. Find the name from the Programs and Features Control Panel window.

  .PARAMETER Name

  The name or partial name of the application.

  .PARAMETER Architecture

  The processor architecture of the target system.

  This can usually be left out, as this function should be called within the
  context of a Chocolatey command, it will use the loaded and internal function,
  Get-ProcessorBits.

  .EXAMPLE

  PS> Uninstall-ChocolateyPackage "foo" "EXE" "/S" (Get-NullsoftUninstaller -Name "Foo")

  .LINK

  https://github.com/AnthonyMastrean/chocolateypackages/blob/1b8671c6a7ca2f068524e663afd372db98bff844/helpers/nullsoft.ps1
#>
function Get-NullsoftUninstaller {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string] $Name,

    [int] $Architecture = (Get-ProcessorBits)
  )

  $key32 = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\"
  $key64 = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\"
  $key = @{64=$key64;32=$key32}[$Architecture]

  $uninstaller = Get-ChildItem $key | %{ Get-ItemProperty $_.PSPath } | ?{ $_.DisplayName -match $Name }
  $uninstaller.UninstallString
}
