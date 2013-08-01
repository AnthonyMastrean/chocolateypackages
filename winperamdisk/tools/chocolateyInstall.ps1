$name    = 'winperamdisk'

try { 
    $tools   = Split-Path $MyInvocation.MyCommand.Definition
    $content = Join-Path (Split-Path $tools) 'content'
    $bin     = Join-Path $env:chocolateyinstall 'bin'
    
    # Move the existing batch files to the bin directory, as a hack to get them
    # in the path!
	Move-Item $content\*.bat $bin 
    
    Write-ChocolateySuccess $name
} 
catch {
    Write-ChocolateyFailure $name $($_.Exception.Message)
    throw 
}