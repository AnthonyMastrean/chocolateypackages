$name = 'win.explorer.separateprocess'
$key  = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced'
    
try { 
    Set-ItemProperty $key -name 'SeparateProcess' -value 1
    Write-ChocolateySuccess $name
} 
catch {
    Write-ChocolateyFailure $name $($_.Exception.Message)
    throw 
}