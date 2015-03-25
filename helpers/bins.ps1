function New-IgnoreBin {
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

function New-GuiBin {
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
