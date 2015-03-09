<#
  .SYNOPSIS

  New-Shortcut creates a new shortcut to a file or program.

  .DESCRIPTION

  New-Shortcut wraps the COM Object, Wscript.Shell, and its arguments to create
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

  .EXAMPLE

  PS> New-Shortcut -Link "foo" -Target "foo.exe" -SpecialFolder "CommonDesktop" -Description "The Foo program"

  .LINK

  https://gist.githubusercontent.com/AnthonyMastrean/998af59e3ea55c87d44a/raw/80f5d54732356a01a908896c082919aa0b33ac9b/shortcut.ps1
#>
function New-Shortcut {
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
    [string] $Description
  )

  $Link = Resolve-ShortcutLink -Link $Link -SpecialFolder $SpecialFolder

  $shell = New-Object -ComObject 'Wscript.Shell'

  $shortcut = $shell.CreateShortcut($Link)
  $shortcut.TargetPath = (Resolve-Path $Target)
  $shortcut.WorkingDirectory = (Split-Path (Resolve-Path $Target))

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
}

function Remove-Shortcut {
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
