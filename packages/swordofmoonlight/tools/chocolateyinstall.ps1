$tools = Split-Path -Parent $MyInvocation.MyCommand.Definition
$installer = Join-Path -Path $tools -ChildPath 'SoM 3D RPG Maker Install.exe'
$translation = Join-Path -Path $tools -ChildPath 'SoM_Translation_Patch_v1.2.exe'
$editing = Join-Path -Path $tools -ChildPath 'SoMEditTools.exe'

Install-ChocolateyZipPackage `
  -PackageName 'swordofmoonlight' `
  -UnzipLocation $tools `
  -Url 'https://www.dropbox.com/s/jxxv4mpn0ptymeh/SoM%203D%20RPG%20Maker%20Install.zip?dl=1' `
  -Checksum '68B3954ABBBD0F1D800AF98EEAEB0E2A3428AFC9CCFAB53CC672685A0FC07ED5' `
  -ChecksumType 'SHA256'

Install-ChocolateyInstallPackage `
  -PackageName 'swordofmoonlight' `
  -FileType 'EXE' `
  -SilentArgs '/VERYSILENT' `
  -File $installer

Install-ChocolateyZipPackage `
  -PackageName 'swordofmoonlight-translation' `
  -UnzipLocation $tools `
  -Url 'https://www.dropbox.com/s/qkumy8z5z4ytxku/SoM_Translation_Patch_v1.2.zip?dl=1' `
  -Checksum '3D68817C8423C3F80391529AD3F268D4E504CB66055AAE254C65FC34E979A45E' `
  -ChecksumType 'SHA256'

Install-ChocolateyInstallPackage `
  -PackageName 'swordofmoonlight-translation' `
  -FileType 'EXE' `
  -SilentArgs '/VERYSILENT' `
  -File $translation

Install-ChocolateyZipPackage `
  -PackageName 'swordofmoonlight-editing' `
  -UnzipLocation $tools `
  -Url 'https://www.dropbox.com/s/g24xg61uoizg8nq/SoMEditTools.zip?dl=1' `
  -Checksum '94243724B2ACB1E6E2F7E60F3F0F986F94297D6E48498A5FCC0A1A65E9471757' `
  -ChecksumType 'SHA256'

Install-ChocolateyInstallPackage `
  -PackageName 'swordofmoonlight-editing' `
  -FileType 'EXE' `
  -SilentArgs '/VERYSILENT' `
  -File $edit
