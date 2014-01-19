require "albacore"

class AhkCompiler
  TaskName = :ahk_compile

  include Albacore::Task
  include Albacore::RunCommand

  attr_accessor :in,
                :out,
                :icon

  def initialize
    @command = default_command
    super()
  end

  def execute
    result = run_command("ahk_compile", build_parameters)
    fail_with_message("AHK compiler failed, see the build log for more details.") unless result
  end

  # Ahk2Exe.exe /in infile.ahk [/out outfile.exe] [/icon iconfile.ico] [/bin AutoHotkeySC.bin]
  def build_parameters
    p = []
    p << "/in \"#{@in}\""
    p << "/out \"#{@out}\"" if @out
    p << "/icon \"#{@icon}\"" if @icon
    p
  end

  def default_command
    File.exist?(installed_command) ? installed_command : "ahk2exe"
  end

  # In x86 Ruby, ENV["PROGRAMFILES"] always resolves to "Program Files (x86)"
  def installed_command
    ENV["PROGRAMFILES"] ? File.join(ENV["PROGRAMFILES"], "AutoHotkey/Compiler/ahk2exe.exe") : ""
  end
end
