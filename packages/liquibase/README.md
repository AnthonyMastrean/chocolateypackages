# Liquibase chocolatey package

To prepare a new Liquibase release, two ways : manually or helped by
`ant` build script.

## Manually


1. Update the version. Then any other version related URLs in the nuspec file
2. Find the new .zip URL on that same github release page and update the install script
3. Update the checksum (`Get-FileHash`, in [PowerShell](https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.utility/get-filehash?view=powershell-6))
4. Try local install : `choco install -fdv liquibase.nuspec`

## Automated

1. Update Liquibase version in `liquibase.properties`
2. Run `ant make`
3. Try local install : `choco install -fdv liquibase.nuspec`
4. You are done : make a Pull Request (all required files have been generated
with all requireds fields, including checksums) : ***tools and `nuspec` only***