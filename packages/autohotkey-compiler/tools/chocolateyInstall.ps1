$name = "autohotkey-compiler"
$compiler = Join-Path $ENV:PROGRAMFILES "AutoHotkey\Compiler"

Install-ChocolateyPath $compiler "Machine"
