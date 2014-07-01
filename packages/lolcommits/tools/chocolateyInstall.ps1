$id = "lolcommits"

try {
  $IMAGEMAGICK_HOME = Resolve-Path(Join-Path $ENV:PROGRAMFILES "ImageMagick*") | Sort-Object -Desc | Select-Object -First 1 -Expand Path

  gem install rmagick --platform=ruby -- "'--with-opt-dir=`"$IMAGEMAGICK_HOME`"'"
  gem install lolcommits --version "= 0.5.4"

  Write-ChocolateySuccess $id
} catch {
  Write-ChocolateyFailure $id $_.Exception.Message
  throw
}
