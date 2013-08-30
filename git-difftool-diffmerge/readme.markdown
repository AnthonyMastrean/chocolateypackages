# DiffMerge in Git for Windows
To configure your [Git][msys] [diff tool][dft], you need a shell script [wrapper][sh] and a few git config calls. This script does all the hard work for you! Alexander Gross fixed it for [baseless diffs][ag]. Enjoy...

    cmd> git difftool <normal-options>

 [sh]: http://markembling.info/2010/01/git-environment-windows
 [dft]: http://schacon.github.com/git/git-difftool.html
 [sdm]: http://www.sourcegear.com/diffmerge/
 [msys]: http://code.google.com/p/msysgit/
 [ag]: http://therightstuff.de/CommentView,guid,f9eb67c2-2a52-4c80-9181-3160b05cfd72.aspx