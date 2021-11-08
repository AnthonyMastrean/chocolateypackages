# VERIFICATION

Verification is intended to assist the Chocolatey moderators and community
in verifying that this package's contents are trustworthy.

## Verification Process

Package can be verified by running Powershell and executing the following commands

### Download the package
```
wget https://github.com/koalaman/shellcheck/releases/download/v0.8.0/shellcheck-v0.8.0.zip -outfile shellcheck-v0.8.0.zip
```

### Verify the checksum
```
Get-FileHash -Algorithm SHA512 .\shellcheck-v0.8.0.zip | Format-List
```

Output
```
Hash : CC5208D9F8799D792122204196FAFB700801B4BAE9BBB0A8F8A999F0A13CCA1BFAD440B96A3746740D85DA55901E1D652592490BC196AFC8BC0EBD0AE20B9AA1
```

# License

File 'LICENSE' is obtained from:

  https://github.com/koalaman/shellcheck/blob/master/LICENSE

