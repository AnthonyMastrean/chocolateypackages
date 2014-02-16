call git config --global diff.tool diffmerge
call git config --global difftool.diffmerge.cmd "C:/Program\ Files/SourceGear/Common/DiffMerge/sgdm.exe \"$LOCAL\" \"$REMOTE\""

call git config --global merge.tool diffmerge
call git config --global mergetool.diffmerge.trustExitCode true
call git config --global mergetool.diffmerge.cmd "C:/Program\ Files/SourceGear/Common/DiffMerge/sgdm.exe /merge /result=\"$MERGED\" \"$LOCAL\" \"$BASE\" \"$REMOTE\""
