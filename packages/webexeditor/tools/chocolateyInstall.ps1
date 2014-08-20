$id = "webexeditor"
$url = "https://akamaicdn.webex.com/client/WBXclient-T29L10NSP7EP2-4/ateditor.msi"
$kind = "MSI"
$silent = "/Q"

Install-ChocolateyPackage $id $kind $silent $url
