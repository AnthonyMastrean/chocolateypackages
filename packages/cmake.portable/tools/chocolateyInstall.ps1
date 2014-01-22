$name    = "cmake.portable"
$url     = "http://www.cmake.org/files/v2.8/cmake-2.8.12.1-win32-x86.zip"
$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

try { 
  Install-ChocolateyZipPackage $name $url $content
  
  # List the installed components
  $bin  = Join-Path $content "cmake-2.8.12.1-win32-x86\bin"
  $gui  = Join-Path $bin "cmake-gui.exe"
  $test = Join-Path $bin "ctest.exe"
  $pack = Join-Path $bin "cpack.exe"
  $deps = Join-Path $bin "cmcldeps.exe"
  $com  = Join-Path $bin "cmw9xcom.exe"
  
  # Ignore. Especially ignore the exes that might collide with chocolatey commands
  @($test, $pack, $deps, $com) | %{ New-Item "$_.ignore" -type file }
  
  # GUI
  @($gui) | %{ New-Item "$_.gui" -type file }
  
  Write-ChocolateySuccess $name
} catch {
  Write-ChocolateyFailure $name $_.Exception.Message
  throw 
}