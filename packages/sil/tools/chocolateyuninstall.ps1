$ErrorActionPreference = 'Stop'

$id      = 'sil'
$name    = 'Sil'

$tools   = Split-Path $MyInvocation.MyCommand.Definition

. $tools\shortcut.ps1

$shortcut_args = @{
  link          = $name
  specialFolder = 'CommonPrograms'
}

Uninstall-Shortcut @shortcut_args
