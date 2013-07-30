$name   = 'miktex'
$url    = 'http://mirrors.ctan.org/systems/win32/miktex/setup/basic-miktex-2.9.4813.exe'
$url64  = 'http://mirrors.ctan.org/systems/win32/miktex/setup/basic-miktex-2.9.4813-x64.exe'
$kind   = 'EXE'
$silent = '--unattended --shared --auto-install=yes'

Install-ChocolateyPackage $name $kind $silent $url $url64


<#
---------------------------
MiKTeX Setup Wizard
---------------------------
Usage: setupwiz [OPTIONS]

Options:

  --allow-unattended-reboot
  --auto-install=yes
  --auto-install=no
  --auto-install=ask
  --common-config=DIR
  --common-data=DIR
  --common-install=DIR
  --common-roots=DIRS
  --download-only
  --dry-run
  --help
  --install-from-local-repository
  --local-package-repository=DIR
  --no-additional-roots
  --no-registry
  --package-set=SET
  --paper-size=A4
  --paper-size=Letter
  --portable
  --private
  --program-folder=NAME
  --remote-package-repository=URL
  --shared
  --unattended
  --user-config=DIR
  --user-data=DIR
  --user-install=DIR
  --user-roots=DIRS


setupwiz reads its arguments from setupwiz.opt, if such a file exists.

See the MiKTeX Manual for more information.
---------------------------
OK   
---------------------------
#>