$id = "setacl"
$url = "http://files.helgeklein.com/downloads/SetACL/current/SetACL%20(executable%20version).zip"
$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

Install-ChocolateyZipPackage $id $url $content

try {     
  $is64bit = Get-ProcessorBits 64

  $bits = @{$true="32 bit";$false="64 bit"}[$is64bit]
  $folder = Join-Path "SetACL (executable version)" $bits
  $remove = Join-Path $content $folder

  Remove-Item $remove -Force -Recurse

  Write-ChocolateySuccess $id
} catch {
  Write-ChocolateyFailure $id $_.Exception.Message
  throw 
}
