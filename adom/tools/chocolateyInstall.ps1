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

set lib=%~dp0..\lib\adom.1.1.1\content

if '%1'=='save' goto save
if '%1'=='load' goto load

:: ADOM writes an 'ADOM_DAT' directory in the current directory at startup. 
:: We want that directory to be in the 'content directory by default.

pushd %lib%
start "" "%lib%\adom.exe" %*
popd
goto :eof

:save
mkdir "%lib%\backup"
copy "%lib%\adom_dat\savedg" "%lib%\backup"
goto :eof

:load
copy "%lib%\backup" "%lib%\adom_dat\savedg"
goto :eof
"@ | Out-File $bat -Encoding ASCII
    
    Write-ChocolateySuccess $name
} 
catch 
{
    Write-ChocolateyFailure $name $($_.Exception.Message)
    throw 
}