$id = "webexnetworkplayer"
$url = "https://welcome.webex.com/client/wbxclient/nbr2player.msi"
$kind = "MSI"
$silent = "/Q"

Install-ChocolateyPackage $id $kind $silent $url
