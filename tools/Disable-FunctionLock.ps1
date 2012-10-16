Set-StrictMode -version latest

$commands_path = "$env:ProgramFiles\Microsoft IntelliType Pro\commands.xml"
$backup_path = $commands_path -replace "\.xml$", ".original.xml"

if(-not(Test-Path $backup_path)) {
  Write-Verbose 'Backing up commands.xml'
  Copy-Item $commands_path $backup_path
}

$key_codes_regex = "^\s*<C(302|203|204|307|308|309|900|901|902|401|311|310)\s.*$"
$xml = [xml] (Get-Content $commands_path) -replace $key_codes_regex, ""
$standard_support = $xml.DPGCmd.ALL.Application | ?{ $_.UniqueName -eq 'StandardSupport' }
$next_f_key = 1
$key_codes = @(302, 203, 204, 307, 308, 309, 900, 901, 902, 401, 311, 310)

$key_codes | %{
  $element = "C{0}" -f $_
  $f_key = "F{0}" -f $next_f_key

  $next_f_key++

  $new = $xml.CreateElement($element)
  $new.SetAttribute('Type', '5')
  $new.SetAttribute('KeySeq', $f_key)

  $standard_support.AppendChild($new) | Out-Null
}

$xml.Save($commands_path)