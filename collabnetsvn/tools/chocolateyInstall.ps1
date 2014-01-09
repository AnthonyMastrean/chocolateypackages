$name   = "collabnetsvn"
$url    = "http://downloads-members.open.collab.net/files/documents/60/8026/CollabNetSubversion-client-1.8.5-1-Win32.exe"
$url64  = "https://www.open.collab.net/files/documents/60/8027/CollabNetSubversion-client-1.8.5-1-x64.exe"
$kind   = "EXE"

$tools  = Split-Path $MyCommand.MyInvocation.Definition
$answer = Join-Path $tools "collabnetsvn.txt"

$silent = "/S /Answerfile=`"$answer`"

Install-ChocolateyPackage $name $kind $silent $url $url64
