call git config --global diff.tool diffmerge
call git config --global difftool.diffmerge.cmd "'%1' "$LOCAL" "$REMOTE""
call git config --global merge.tool diffmerge
call git config --global mergetool.diffmerge.cmd "'%2' "$PWD/$LOCAL" "$PWD/$BASE" "$PWD/$REMOTE" "$PWD/$MERGED""
call git config --global mergetool.diffmerge.trustExitCode false
call git config --global mergetool.diffmerge.keepBackup false