# Fonts Extension

The necessary flags to the `Folder.CopyHere` method for copying font files into
the Windows Fonts special folder DON'T WORK. Luckily, some senior person within
Microsoft provided example code that _works_!

https://blogs.technet.microsoft.com/deploymentguys/2010/12/04/adding-and-removing-fonts-with-windows-powershell/

## Getting Started

You should add the extension package as a dependency to your package.

```xml
<dependencies>
    <dependency id="fonts.extension" version="1.0" />
</dependencies>
```

## Cmdlets

### Add-Font

_Coming soon!_

### Remove-Font

_Coming soon!_
