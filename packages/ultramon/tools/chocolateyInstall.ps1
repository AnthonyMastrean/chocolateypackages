Install-ChocolateyPackage `
    -PackageName 'ultramon' `
    -FileType 'MSI' `
    -Silent '/Q /NORESTART' `
    -Url 'http://www.realtimesoft.com/files/UltraMon_3.4.1_en_x32.msi' `
    -Checksum 'A5FFB1632626008BDFF8E5C8D6CD94677878272257DCC22D33980C982CC8863F' `
    -ChecksumType 'SHA256' `
    -Url64 'http://www.realtimesoft.com/files/UltraMon_3.4.1_en_x64.msi' `
    -Checksum64 'C950C739883802137B650C4BE9EDA050AFFA9BDD08F6D138A0D58B698D105A17' `
    -ChecksumType64 'SHA256'
