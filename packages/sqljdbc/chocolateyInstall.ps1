$name   = 'sqljdbc'
$url    = 'http://download.microsoft.com/download/0/2/A/02AAE597-3865-456C-AE7F-613F99F850A8/sqljdbc_4.0.2206.100_enu.exe'
$kind   = 'EXE'
$proper = 'Microsoft JDBC Driver 4.0 for SQL Server'
$tools  = Split-Path $MyInvocation.MyCommand.Definition
$local  = Join-Path $tools $proper
$target = Join-Path $ENV:PROGRAMFILES $proper
$silent = "'/auto `"$local`"'"

Install-ChocolateyPackage -PackageName $name -FileType $kind -SilentArgs $silent -Url $url

try {
  Start-ChocolateyProcessAsAdmin -ExeToRun 'xcopy' -Statements "`"$local`" `"$target`" /Y /E /I /Q"
  Remove-Item $local -Force -Recurse

  Write-ChocolateySuccess $name
} 
catch {
  Write-ChocolateyFailure $name $($_.Exception.Message)
  throw 
}