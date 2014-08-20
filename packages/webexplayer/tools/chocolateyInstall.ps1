$id = "webexplayer"
$url = "https://welcome.webex.com/client/wbxclient/atrecply.msi"
$kind = "MSI"
$silent = "/Q"

Install-ChocolateyPackage $id $kind $silent $url
