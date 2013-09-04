require "albacore"

file "bin/underscore.exe.gui"

exec :compile => ["bin/underscore.exe.gui"] do |cmd| 
  cmd.command = Join-Path ENV["PROGRAMFILES"], "AutoHotkey\Compiler\ahd2exe.exe"
  cmd.parameters = [
    "/in", "lib/underscore.ahk", 
    "/out", "bin/underscore.exe", 
    "/icon", "lib/underscore_on.ico"
  ]
end
