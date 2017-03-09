Install-ChocolateyPackage `
    -PackageName 'isorecorder' `
    -FileType 'MSI' `
    -SilentArgs '/QN' `
    -Url 'http://alexfeinman.com/download/IsoRecorder/ISORecorder3.1.3.x86.msi' `
    -Checksum '79BFBBD0D4ACB29776E91EAFB22B1143B4D5F9975FBF0C13A84FA5ED13826408' `
    -ChecksumType 'SHA256' `
    -Url64 'http://alexfeinman.com/download/IsoRecorder/ISORecorder3.1.3.x64.msi' `
    -Checksum64 '1DB4C5DECD077357F996017A6D69062045CF0FAFDE5A282EF0581F106084E4B0' `
    -ChecksumType64 'SHA256'
