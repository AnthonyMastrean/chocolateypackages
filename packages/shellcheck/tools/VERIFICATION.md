# VERIFICATION

Verification is intended to assist the Chocolatey moderators and community
in verifying that this package's contents are trustworthy.

## Verification Process

Package can be verified by running Powershell and executing the following commands

### Download the package
```
wget https://github.com/koalaman/shellcheck/releases/download/v0.9.0/shellcheck-v0.9.0.zip -outfile shellcheck-v0.9.0.zip
```

### Verify the checksum
```
Get-FileHash -Algorithm SHA512 .\shellcheck-v0.9.0.zip | Format-List
```

Output
```
Hash : 31F415A995864D238E4C286CFD0227DAE3C9BCC6C327B925E182A390C9258A1783F815BA4389D85BEA504CFE62B1BABDC862303F2EF014AF66D4189A42797BD0
```

# License

File 'LICENSE' is obtained from:

  https://github.com/koalaman/shellcheck/blob/master/LICENSE

