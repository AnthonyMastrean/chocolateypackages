# DiffMerge in Git for Windows
To use the SourceGear [DiffMerge][3] tool in [Git for Windows][4], you have to 
setup a [shell script][1] wrapper to properly call the tool. Once that is
done, you invoke the [tool][2] by using

    x:\> git difftool <normal-options>
    
Alexander Gross fixes the [script][5] for baseless diffs, albeit, for a Cygwin 
environment.


 [1]: http://markembling.info/2010/01/git-environment-windows
 [2]: http://schacon.github.com/git/git-difftool.html
 [3]: http://www.sourcegear.com/diffmerge/
 [4]: http://code.google.com/p/msysgit/
 [5]: http://therightstuff.de/CommentView,guid,f9eb67c2-2a52-4c80-9181-3160b05cfd72.aspx