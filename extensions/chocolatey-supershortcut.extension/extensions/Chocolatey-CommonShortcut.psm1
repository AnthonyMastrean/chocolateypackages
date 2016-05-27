function Install-ChocolateyCommonShortcut {

<#
  .SYNOPSIS

  Create a shortcut in one of the Windows special folders, like on the desktop
  or in the Start Menu programs folder.

  .DESCRIPTION

  Create a shortcut in one of the Windows special folders, like on the Desktop
  or in the Start Menu Programs folder. This function wraps the built-in
  Install-ChocolateyShortcut, but only exposes behavior for creating shortcuts
  in these special folders.

  .PARAMETER ShortcutName

  The display name of the shortcut.

  The file name of the shortcut, minus its extension, is used as its "display
  name". But, you shouldn't worry about the file extension, this function will
  ensure it's appopriate.

  .PARAMETER SpecialFolder

  The Windows special folder to contain this shortcut. Here are some common and
  obvious folders for application shortcuts:

    * CommonDesktop
    * CommonPrograms
    * CommonStartup

  https://msdn.microsoft.com/en-us/library/system.environment.specialfolder(v=vs.110).aspx

  .PARAMETER Launch

  Launch the shortcut after creating it, which is useful for startup shortcuts.

  .EXAMPLE

  Install-ChocolateyCommonShortcut -ShortcutName "Foo" -TargetPath "foo.exe" -SpecialFolder "CommonPrograms"

  .EXAMPLE

  Uninstall-ChocolateyCommonShortcut -ShortcutName "Foo" -SpecialFolder "CommonPrograms"

  .LINK

  https://github.com/AnthonyMastrean/chocolateypackages/tree/master/extensions/Chocolatey-CommonShortcut.psm1
#>

  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    $ShortcutName,

    [Parameter(Mandatory = $true)]
    [ValidateScript({ [System.Environment+SpecialFolder]$_ })]
    $SpecialFolder,

    [switch] $Launch
  )

  # See about_Splatting for more information on this approach.
  #
  #   https://technet.microsoft.com/en-us/library/jj672955.aspx
  #

  $ShortcutFilePath = Join-Path ([System.Environment]::GetFolderPath($SpecialFolder)) $ShortcutName
  $PsBoundParameters['ShortcutFilePath'] = $ShortcutFilePath

  Install-ChocolateyShortcut @PsBoundParameters

  if($Launch) {
    & $ShortcutFilePath
  }
}

function Uninstall-ChocolateyCommonShortcut {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    $ShortcutName,

    [Parameter(Mandatory = $true)]
    [ValidateScript({ [System.Environment+SpecialFolder]$_ })]
    $SpecialFolder
  )

  Remove-Item -Path (Join-Path ([System.Environment]::GetFolderPath($SpecialFolder)) $ShortcutName) -Force | Out-Null
}
