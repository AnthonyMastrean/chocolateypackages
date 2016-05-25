<#
  .SYNOPSIS

  Install-Shortcut creates a new shortcut to a file or program.

  .DESCRIPTION

  Install-Shortcut wraps the COM Object, Wscript.Shell, and its arguments to create
  a shortcut to a file or program. It requires some very specific input, please
  review the notes on each parameter.

  .PARAMETER Link

  The shortcut to create.

  The underlying COM Object requires an absolute path. This function will
  attempt to properly expand that path, especially if you provide a
  SpecialFolder as a root directory.

  The underlying COM Object also requires that the link's path/name end in
  either .lnk or .url. This function will attempt to add that file extension if
  it is not provided.

  The underlying COM Object will fail silently in many cases, especially due to
  improperly formatted link paths. This function will test the existence of the
  expected link using this parameter and fail if it is not found.

  .PARAMETER Target

  The target of the shortcut.

  This path must exist. This function will attempt to expand the path to its
  absolute value.

  .PARAMETER SpecialFolder

  The Windows special folder to contain this shortcut.

  If you want to create a shortcut at one of the system managed paths, such as
  the Desktop or the Start Menu, you should use the special tokens provided.
  The most commonly used are

    * CommonDesktop
    * CommonStartup
    * CommonPrograms

  If you provide a special folder, the Link parameter may contain a simple
  "name" and not a file path.

  The full list of special folders can be found here:

  https://msdn.microsoft.com/en-us/library/system.environment.specialfolder(v=vs.110).aspx

  .PARAMETER Icon

  The icon of the shortcut.

  This can take several forms and, due to this, is not validated carefully. You
  can provide an absolute file path (this is your responsibility), like

    "C:\Windows\notepad.exe"

  Or, you can provide an absolute file path and an index into the resources of
  that program, like

    "C:\Windows\notepad.exe, 1"

  .PARAMETER Description

  The tooltip to display on the shortcut.

  .PARAMETER Launch

  Whether to launch this link immediately after creating it. Useful for links
  created in the CommonStartup special folder.

  .EXAMPLE

  Install-Shortcut -Link "foo" -Target "foo.exe" -SpecialFolder "CommonPrograms" -Description "Foo Bar"

  .EXAMPLE

  Uninstall-Shortcut -Link "foo" -SpecialFolder "CommonDesktop"

  .LINK

  https://github.com/AnthonyMastrean/chocolateypackages/blob/master/helpers/shortcut.ps1
#>
function Install-Shortcut {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string] $Link,

    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [ValidateScript({ Test-Path $_ })]
    [string] $Target,

    [string] $SpecialFolder,
    [string] $Icon,
    [string] $Description,
    [switch] $Launch
  )

  $Link = Resolve-ShortcutLink -Link $Link -SpecialFolder $SpecialFolder

  $shell = New-Object -ComObject 'Wscript.Shell'

  $shortcut = $shell.CreateShortcut($Link)
  $shortcut.TargetPath = (Resolve-Path $Target).Path
  $shortcut.WorkingDirectory = (Split-Path (Resolve-Path $Target).Path)

  if($Icon) {
    $shortcut.IconLocation = $Icon
  }

  if($Description) {
    $shortcut.Description = $Description
  }

  $shortcut.Save()

  if(-not(Test-Path $Link)) {
    throw "Failed to create shortcut: $Link"
  }

  if($Launch) {
    & $Link
  }
}

function Uninstall-Shortcut {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string] $Link,

    [string] $SpecialFolder
  )

  $Link = Resolve-ShortcutLink -Link $Link -SpecialFolder $SpecialFolder

  Remove-Item $Link -Force | Out-Null
}

function Resolve-ShortcutLink {
  param(
    [Parameter(Mandatory = $true)]
    [ValidateNotNullOrEmpty()]
    [string] $Link,

    [string] $SpecialFolder
  )

  if(-not($Link.ToLower().EndsWith('.lnk') -or $Link.ToLower().EndsWith('.url'))) {
    $Link = "$Link.lnk"
  }

  if($SpecialFolder) {
    $Link = Join-Path ([System.Environment]::GetFolderPath($SpecialFolder)) $Link
  }

  $ExecutionContext.SessionState.Path.GetUnresolvedProviderPathFromPSPath($Link)
}
