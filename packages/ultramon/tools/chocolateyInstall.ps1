Install-ChocolateyPackage `
    -PackageName 'ultramon' `
    -FileType 'MSI' `
    -Silent '/Q /NORESTART' `
    -Url 'http://www.realtimesoft.com/files/UltraMon_3.4.0_en_x32.msi' `
    -Checksum 'E88EDEF08C1785CF1A1C5ADFD4E83589A5EFE5E04E6472D41E1B2BD953367C2E' `
    -ChecksumType 'SHA256' `
    -Url64 'http://www.realtimesoft.com/files/UltraMon_3.4.0_en_x64.msi' `
    -Checksum64 '6A567BFC642ABDBAC0E9C236F793D0A6381BF926E5784637039FFF06167F6661' `
    -ChecksumType64 'SHA256'
