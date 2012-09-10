#requires -version 2
set-strictmode -version latest

$matchRegex = "^\s*<C(302|203|204|307|308|309|900|901|902|401|311|310)\s.*$"
$fileName = "$env:ProgramFiles\Microsoft IntelliType Pro\commands.xml"
$backupFileName = $fileName -replace "\.xml$", ".original.xml"

if (-not (test-path $backupFileName)) {
    write-verbose "Backing up commands.xml"
    cp $fileName $backupFileName
}

$file = (get-content $fileName) -replace $matchRegex, ""

$xml = [xml]$file
$allAppsStd = $xml.DPGCmd.ALL.Application |
    ?{ $_.UniqueName -eq "StandardSupport" }

$nextFKey = 1
$keyCodes = @(302, 203, 204, 307, 308, 309, 900, 901, 902, 401, 311, 310)

$keyCodes |
    %{
        $elemName = "C{0}" -f $_
        $fkey = "F{0}" -f $nextFKey

        $nextFKey++

        $new = $xml.CreateElement($elemName)

        $new.SetAttribute("Type", "5")
        $new.SetAttribute("KeySeq", $fkey)

        $allAppsStd.AppendChild($new) | out-null
    }

$xml.Save($fileName)