$id  = "pmd"
$url = "https://github.com/pmd/pmd/releases/download/pmd_releases%2F5.8.1/pmd-bin-5.8.1.zip"

$tools    = Split-Path $MyInvocation.MyCommand.Definition
$content  = Split-Path $tools
$pmd_home = Join-path $content "pmd-bin-5.8.1"
$pmd_bin  = Join-Path $pmd_home "bin/pmd.bat"
$cpd_bin  = Join-Path $pmd_home "bin/cpd.bat"

Install-ChocolateyZipPackage -PackageName $id -Url $url -UnzipLocation $content -Checksum 2D854E30717B66E253213F36D4BCD202B83B180EA427836797D13A857C19A6B4 -ChecksumType sha256
Install-ChocolateyEnvironmentVariable -VariableName "PMD_HOME" -VariableValue $pmd_home -VariableType "Machine"

Install-BinFile -Name "pmd" -Path $pmd_bin
Install-BinFile -Name "cpd" -Path $cpd_bin

Update-SessionEnvironment
