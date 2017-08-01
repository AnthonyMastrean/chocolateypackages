Install-ChocolateyPackage `
    -PackageName 'inssider-home' `
    -FileType 'MSI' `
    -SilentArgs '/QN' `
    -Url 'http://files01.techspot.com/temp/inSSIDer-installer.msi' `
    -Checksum '05C0442D092C5AD067AAA2DCBD4119866FE2BEF01B22A5906EF6AE9E592D3D3E' `
    -ChecksumType 'SHA256'
