$id  = "NugetPackageManager"
$url = "https://visualstudiogallery.msdn.microsoft.com/27077b70-9dad-4c64-adcf-c7cf6bc9970c/file/37502/39/NuGet.Tools.vsix"

Install-ChocolateyVsixPackage -PackageName $id -VsixUrl $url
