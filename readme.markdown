# MSpec Version Switcher
MSpec & ReSharper work well [together][1], but there's a hitch. How do you keep your integration straight if you have multiple active projects using different versions of MSpec?

Well, now you just install this package

    cmd> cinst mspec-version-switcher
    
And, from your solution root (assuming you're using NuGet)

    cmd> Install-MSpec

This will find your version of ReSharper, the latest version of MSpec in that solution's `packages` directory, and execute the appropriate integration batch file.

You'll have to press `Enter` to get the script to finish, as there's a hardcoded `Pause` in there.

 [1]: https://github.com/machine/machine.specifications#resharper