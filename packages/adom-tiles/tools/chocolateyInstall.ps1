$id     = "adom"
$url    = "http://www30.zippyshare.com/v/68255892/file.html"

# <a id="dlbutton" href="/d/68255892/9029/adom_noteye_windows_1.2.0_pre23.zip"><img src="/images/download.png" alt="Download" border="0"></a>
$dl_match = '<a id="dlbutton" href="(?<chunk>.*?)">'

$tools = Split-Path $MyInvocation.MyCommand.Definition
$content = Join-Path (Split-Path $tools) "content"

$link = "adom"
$folder = "CommonPrograms"
$target = Join-Path $content "adom\Adom.exe"
$description = "Ancient Domains of Mystery"

. $tools\shortcut.ps1

try {
  $request = Invoke-WebRequest $url -SessionVariable session

  if(-not($request.Content -match $dl_match)) {
    throw "Cannot extract download URL from request."
  }

  $dl_url = "http://www30.zippyshare.com$($matches['chunk'])"

  Install-ChocolateyZipPackage $id $dl_url $content

  New-Shortcut -Link $link -Target $target -SpecialFolder $folder -Description $description

  Write-ChocolateySuccess $id
} catch {
  Write-ChocolateyFailure $id $_.Exception.Message
  throw
}
