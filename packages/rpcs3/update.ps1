Import-Module AU

function global:au_SearchReplace {
    @{
        "tools\chocolateyInstall.ps1" = @{
			"(^[$]url64\s*=\s*)('.*')"      = "`$1'$($Latest.URL64)'"          
            "(^[$]checksum64\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
		}
	}
}


function global:au_GetLatest {
	$download_page = Invoke-WebRequest -Uri https://rpcs3.net/download  -UseBasicParsing
	$regex       = 'rpcs3-.*_win64.7z'
    
	$url         = $download_page.links | ? href -match $regex | select -First 1 -expand href
	$version       = (($url -split '[-]' | select -Last 2 -Skip 1) -join "-").tostring().Substring(1).replace('-', '-alpha')
	
	return @{ Version = $version; URL64 = $url }
}

Update-Package -checksumfor 64