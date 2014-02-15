function Get-Icon {
  param(
    [Parameter(Mandatory = $true)]
    [string] $uri,
    [string] $name
  )

  if(-not($name)) {
    $name = Split-Path -Leaf $uri
  }

  $client = New-Object System.Net.WebClient
  $client.DownloadFile($url, (Join-Path $pwd "public\icons\$name"))
}