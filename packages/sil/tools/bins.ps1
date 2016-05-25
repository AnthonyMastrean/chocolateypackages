<#
  .SYNOPSIS

  Create a .ignore file for a package binary.

  .DESCRIPTION

  Chocolatey automatically creates a "shim" in a special folder, on your
  machine's PATH, for any executables found in the package's installation
  directory. This is helpful when installing ZIP packages or any kind of
  command line tools.

  Chocolatey can be instructed to ignore a particular binary by creating a file
  at the same path with the same name as the binary to ignore, except ending
  with the file extension ".ignore".

  This function creates that file, given the binary's path.

  .PARAMETER Path

  The path of the binary to ignore.

  This parameter also accepts multiple paths or pipeline input.

  .EXAMPLE

  Install-IgnoreBin -Path "foo.exe"

  .EXAMPLE

  Install-IgnoreBin -Path $foo, $bar

  .EXAMPLE

  Get-ChildItem "$content\foo\*.exe" | Install-IgnoreBin

  .LINK

  https://github.com/AnthonyMastrean/chocolateypackages/blob/master/helpers/bins.ps1
#>
function Install-IgnoreBin {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
    [ValidateNotNullOrEmpty()]
    [ValidateScript({ Test-Path $_ })]
    [string[]] $Path
  )

  PROCESS {
    foreach($item in $Path) {
      New-Item "$(Resolve-Path $item).ignore" -Type "File" -Force | Out-Null
    }
  }
}

<#
  .SYNOPSIS

  Create a .gui file for a package binary.

  .DESCRIPTION

  Chocolatey automatically creates a "shim" in a special folder, on your
  machine's PATH, for any executables found in the package's installation
  directory. This is helpful when installing ZIP packages or any kind of
  command line tools.

  Chocolatey can be instructed to treat a particular binary as a GUI application,
  meaning it will START the binary in a separate process and not block the
  console, by creating a file at the same path with the same name as the binary,
  except ending with the file extension ".gui".

  This function creates that file, given the binary's path.

  .PARAMETER Path

  The path of the binary to treat as a GUI application.

  This parameter also accepts multiple paths or pipeline input.

  .EXAMPLE

  Install-GuiBin -Path "foo.exe"

  .EXAMPLE

  Install-GuiBin -Path $foo, $bar

  .EXAMPLE

  Get-ChildItem "$content\foo\*.exe" | Install-GuiBin

  .LINK

  https://github.com/AnthonyMastrean/chocolateypackages/blob/master/helpers/bins.ps1
#>
function Install-GuiBin {
  [CmdletBinding()]
  param(
    [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
    [ValidateNotNullOrEmpty()]
    [ValidateScript({ Test-Path $_ })]
    [string[]] $Path
  )

  PROCESS {
    foreach($item in $Path) {
      New-Item "$(Resolve-Path $item).gui" -Type "File" -Force | Out-Null
    }
  }
}
