$module_root = Split-Path $MyInvocation.MyCommand.Definition

Get-ChildItem $module_root\lib\*.ps1 | %{ . $_.FullName }

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

function Get-PackageMetadata {
  [xml](Get-Content $pwd\*.nuspec)
}

Export-ModuleMember -Function New-ChocolateyPackage, `
                              Write-ChocolateyPackage, `
                              Install-ChocolateyPackage, `
                              Push-ChocolateyPackage
