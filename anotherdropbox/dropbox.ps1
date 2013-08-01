$username = "dropbox-$([Guid]::NewGuid().Guid)"

NET USER $username /ADD /PASSWORDREQ:NO /EXPIRES:NEVER /COMMENT:"Automatic account for multiple Dropbox sync"
