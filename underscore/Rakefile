require "albacore"

specs = FileList["*.nuspec"]

file "bin/underscore.exe.gui"

desc "compile the script into an exe"
exec :compile => ["bin/underscore.exe.gui"] do |cmd| 
  cmd.command = (File.join ENV["PROGRAMFILES"], "AutoHotkey/Compiler/ahk2exe.exe")
  cmd.parameters = [
    "/in", "lib/underscore.ahk", 
    "/out", "bin/underscore.exe", 
    "/icon", "lib/underscore_on.ico"
  ]
end

specs.each do |spec|
  exec spec do |cmd|
    cmd.command = "cpack"
    cmd.parameters = spec
  end
end

desc "build all chocolatey packages"
task :build => [:compile, specs].flatten
