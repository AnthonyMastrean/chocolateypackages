$here = Split-Path $MyInvocation.MyCommand.Definition

Get-ChildItem $here\lib\*.ps1 | %{ . $_.FullName }

function Replace-Token {
  param(
    [Parameter(Mandatory = $true)]
    [string]$token, 
    [Parameter(Mandatory = $true)]
    [string]$replacement, 
    [Parameter(ValueFromPipeline = $true)]
    [string]$path
  )
  
  (Get-Content $path) `
    | %{ $_ -replace $token, $replacement } `
    | Set-Content $path
}

function Test-NullPath {
  param(
    [Parameter(Mandatory = $true)]
    [string]$path
  )

  if($path -eq $null) { 
    return $false 
  }
  
  return (Test-Path $path)
}

Export-ModuleMember -Function New-ChocolateyPackage, Reset-ChocolateyPackage, Test-ChocolateyPackage, Publish-ChocolateyPackage
