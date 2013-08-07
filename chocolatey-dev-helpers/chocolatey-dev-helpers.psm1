$here = Split-Path $MyInvocation.MyCommand.Definition

. $here\lib\New-ChocolateyPackage.ps1
. $here\lib\Clean-ChocolateyPackage.ps1
. $here\lib\Debug-ChocolateyPackage.ps1
. $here\lib\Publish-ChocolateyPackage.ps1

function Replace-Token {
  param(
    [string]$token, 
    [string]$replacement, 
    [Parameter(ValueFromPipeline = $true)]
    [string]$path
  )
  
  (Get-Content $path) `
    | %{ $_ -replace $token, $replacement }   
    | Set-Content $path
}

function Test-NullPath($path) {
    if($path -eq $null) { 
      return $false 
    }
    
    return (Test-Path $path)
}

Export-ModuleMember -Function New-ChocolateyPackage, Clean-ChocolateyPackage, Test-ChocolateyPackage, Publish-ChocolateyPackage
