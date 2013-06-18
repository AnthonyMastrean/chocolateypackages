param([switch]$LowSecurity)

$terminal = 'HKLM:\System\CurrentControlSet\Control\Terminal Server'
$rdp      = 'HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp'
$auth     = 'UserAuthentication'
$deny     = 'fDenyTSConnections'
$on       = 1
$off      = 0
$dword    = 'DWORD'

function Set-OrCreateRegistryItem {
  param(
    [string]$Path,
    [string]$Name,
    $Value,
    [string]$PropertyType
  )

  $item = (Get-Item -Path $path).GetValue($name)
  
  if($item -eq $null) {
    Write-Debug "Creating $path\$name = $value"
    New-ItemProperty -Path $path -Name $name -Value $value -PropertyType $type
    return
  }
  
  Write-Debug "Setting $path\$name = $value"
  Set-ItemProperty -Path $path -Name $name -Value $value
}

function Write-RemoteDesktopConfig {
  if ((Get-ItemProperty -Path $terminal).$deny -eq $on) {
    return "RDP :: Deny Connections"
  }
  
  if ((Get-ItemProperty -Path $rdp).$auth -eq $on) {
    return "RDP :: Secure Connections Allowed"
  } 
  
  return "RDP :: All Connections Allowed"
} 

Set-OrCreateRegistryItem -Path $terminal -Name $deny -Value $off -PropertyType $dword

if ($LowSecurity) {
  Set-OrCreateRegistryItem -Path $rdp -Name $auth -Value $off -PropertyType $dword
} else {
  Set-OrCreateRegistryItem -Path $rdp -Name $auth -Value $on -PropertyType $dword
}

Write-RemoteDesktopConfig