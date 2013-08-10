Task new {
  New-ChocolateyPackage
}

Task pack {
  Pack-ChocolateyPackage
}

Task install -Depends pack {
  Install-ChocolateyPackage
}

Task push -Depends pack { 
  Push-ChocolateyPackage
}
