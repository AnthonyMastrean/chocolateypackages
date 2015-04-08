# We have to clean up our custom shims
@("rsync.exe", "ssh.exe", "ssh-keygen.exe") `
  | %{ Join-Path $ENV:chocolateyInstall "bin\$_" } `
  | ?{ Test-Path $_ } `
  | Remove-Item -Force
