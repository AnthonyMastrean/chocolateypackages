$name = 'adom'
$url  = 'http://www.adom.de/adom/download/windows/111/adom_winbeta4.zip'

$tools   = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) 'content'
$bat     = "$ENV:CHOCOLATEYINSTALL\bin\adom.bat"

try 
{ 
    Install-ChocolateyZipPackage $name $url $content
    Move-Item $content\adom_winbeta4.exe $content\adom.exe -force
 
@"
@echo off

if '%1'=='save' goto save
if '%1'=='load' goto load

:: ADOM writes an 'ADOM_DAT' directory in the current directory at startup. 
:: We want that directory to be in the 'content directory by default.

pushd %~dp0
"%~dp0..\lib\adom.1.1.1\content\adom.exe" %*
popd
goto :eof

:save
mkdir "%~dp0\backup"
copy "%~dp0\adom_dat\savedg" "%~dp0\backup"
goto :eof

:load
copy "%~dp0\backup" "%~dp0\adom_dat\savedg"
goto :eof
"@ | Out-File $bat -Encoding ASCII
    
    Write-ChocolateySuccess $name
} 
catch 
{
    Write-ChocolateyFailure $name $($_.Exception.Message)
    throw 
}